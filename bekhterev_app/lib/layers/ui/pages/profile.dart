import 'package:bekhterev_app/layers/services/api_gateway/impl/api_gateway.dart';
import 'package:bekhterev_app/splash/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/components/styles.dart';

import 'package:bekhterev_app/layers/blocs/pages/profile/profiles_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/adapters/ui/profiles.dart' as ui;
import 'package:bekhterev_app/adapters/domain/profiles.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/profiles.dart';
import 'package:bekhterev_app/layers/services/impl/profiles.dart';
import 'package:bekhterev_app/layers/use_cases/impl/profiles.dart';

import 'package:bekhterev_app/layers/ui/pages/notifications.dart';
import 'package:bekhterev_app/layers/ui/pages/receipts.dart';
import 'package:bekhterev_app/layers/ui/pages/results.dart';
import 'package:bekhterev_app/pages/calendar/calendar_page.dart';
import 'package:bekhterev_app/layers/ui/pages/tests.dart';

ProfilesBloc _bloc(BuildContext context) => BlocProvider.of(context);

class ProfilesPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfilesBloc(
        ProfilesUseCaseImpl(
          ProfilesServiceImpl(
            ApiGatewayImpl(),
            domain.ProfilesAdapter(),
          ),
          ui.ProfilesAdapter(),
        ),
      )..add(OnLoad()),
      child: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => ProfilesPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: false,
        backgroundColor: Color(0xFF2280CE),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: BottomNavHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<ProfilesBloc, ProfilesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return _Loading();
          } else if (state is LoadingErrorState) {
            return _LoadingError(state.error);
          } else if (state is LoadedState) {
            return _Loaded(state.data);
          } else {
            throw StateError('Unknown state: $state');
          }
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFE8C883)),
      ),
    );
  }
}

class _LoadingError extends StatelessWidget {
  final AppError error;

  const _LoadingError(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error.title),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _bloc(context).add(OnLoad()),
            child: Text('Попробовать ещё раз.'),
          ),
        ],
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  final ProfileDetailed data;

  const _Loaded(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageContainer(
      topInfo: _Name(),
      child: _Body(),
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    );
  }
}

class _Name extends StatelessWidget {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width * 0.65;

    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
      height: 110,
      width: double.infinity,
      color: Color(0xFF42A1F0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Icon(Icons.account_circle_outlined, size: 45, color: Color(0xFFFFFFFF)),
          ),
          SizedBox(width: 20),
          Container(
            width: textWidth,
            child: StreamBuilder<QuerySnapshot>(
              stream: _users.snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                      if (documentSnapshot['phone'] == user!.phoneNumber) {
                        return Text(documentSnapshot['name'].toString(), style: Styles.titleWhite);
                      } else if (user!.phoneNumber != null) {
                        return SizedBox();
                      }
                      return SizedBox();
                    },
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppListEntryLayout(
          sufix: AppFilledCircleIcon(icon: Icons.visibility),
          title: AppNormalHeader('Уведомления'.toUpperCase()),
          subTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Новое: 1',
                  style: Styles.descriptionImportant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'Всего: 12',
                  style: Styles.descriptionOld,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(context, NotificationsPage.route()),
        ),
        AppListEntryLayout(
          sufix: AppFilledCircleIcon(icon: Icons.visibility),
          title: AppNormalHeader('Чеки оплаты'.toUpperCase()),
          subTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Новое: 2',
                  style: Styles.descriptionImportant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'Всего: 5',
                  style: Styles.descriptionOld,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(context, ReceiptsPage.route()),
        ),
        AppListEntryLayout(
          sufix: AppFilledCircleIcon(icon: Icons.visibility),
          title: AppNormalHeader('Результаты исследований'.toUpperCase()),
          subTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Новое: 0',
                  style: Styles.descriptionImportant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'Всего: 10',
                  style: Styles.descriptionOld,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(context, ResultsPage.route()),
        ),
        AppListEntryLayout(
          sufix: AppFilledCircleIcon(icon: Icons.visibility),
          title: AppNormalHeader('Календарь посещений'.toUpperCase()),
          subTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Новое: 2',
                  style: Styles.descriptionImportant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'Всего: 2',
                  style: Styles.descriptionOld,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(context, CalendarPage.route()),
        ),
        AppListEntryLayout(
          sufix: AppFilledCircleIcon(icon: Icons.visibility),
          title: AppNormalHeader('Онлайн-тестирование'.toUpperCase()),
          subTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Новое: 0',
                  style: Styles.descriptionImportant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'Всего: 0',
                  style: Styles.descriptionOld,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(context, TestsPage.route()),
        ),
        AppListEntryLayout(
            sufix: AppFilledCircleIcon(icon: Icons.logout),
            title: AppNormalHeader('Выйти'.toUpperCase()),
            onTap: () {
              _logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SplashPage()),
                  (Route<dynamic> route) => false);
            }),
      ],
    );
  }
}
