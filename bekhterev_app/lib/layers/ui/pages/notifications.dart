import 'package:bekhterev_app/components/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bekhterev_app/components/components.dart';

import 'package:bekhterev_app/layers/blocs/pages/notifications/notifications_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';

import 'package:bekhterev_app/adapters/ui/notifications.dart';
import 'package:bekhterev_app/layers/models/ui/notification.dart';
import 'package:bekhterev_app/layers/services/impl/notificatios.dart';
import 'package:bekhterev_app/layers/use_cases/impl/notifications.dart';
import 'package:intl/intl.dart';

NotificationsBloc _bloc(BuildContext context) => BlocProvider.of(context);

class NotificationsPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsBloc(
        NotificationsUseCaseImpl(
          NotificationsServiceImpl(),
          NotificationsAdapter(),
        ),
      )..add(OnLoad()),
      child: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => NotificationsPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Уведомления'),
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
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
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
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFE8C883))
        )
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
  final Iterable<NotificationInfo> data;

  const _Loaded(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Expanded(
          child: AppPageContainer(
            padding: EdgeInsets.zero,
            child: _List(data),
          ),
        ),
      ),
    ]);
  }
}

class _List extends StatelessWidget {
  final Iterable<NotificationInfo> data;

  const _List(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: _Notification(),
    );
  }
}

class _Notification extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  String formatTimestamp(Timestamp timestamp) {
    var format = new DateFormat('dd/MM/yyy HH:mm');
    return format.format(timestamp.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.phoneNumber)
            .collection('notifications')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              addRepaintBoundaries: false,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot notification =
                streamSnapshot.data!.docs[index];

                return SladableLayout(
                  id: notification['id'],
                  title: notification['title'],
                  onTap: () {
                    showFlushbar(context, notification['title'], ' удалено.');

                    FirebaseFirestore.instance.collection('users')
                        .doc(user!.phoneNumber).collection('notifications')
                        .doc( streamSnapshot.data!.docs[0].id).delete();
                    },

                  child: AppListEntryLayout(
                    sufix: AppFilledCircleIcon(icon: Icons.visibility),
                    title: notification['isNew'] ? AppNormalHeader(notification['title'].toString().toUpperCase()) : AppNormalHeader(notification['title'].toString().toUpperCase(), color: Color(0xFF979797)),
                    subTitle: notification['isNew'] ? AppNormalText(notification['short_description'].toString()) : AppNormalText(notification['short_description'].toString(), color: Color(0xFF979797)),
                    onTap: () {
                      print('Tapped to ' + notification['title'].toString() + '.');

                      // final id = FirebaseFirestore.instance.collection('users')
                      // .doc(user!.phoneNumber).collection('notifications')
                      // .doc( streamSnapshot.data!.docs[0].id);

                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalLayout(
                              title: notification['title'],
                              date: Text(
                                formatTimestamp(notification['date']),
                                style: Styles.dateModal,
                              ),
                              description: ModalDescriptionLayout(descriptionText: notification['full_description']),
                              delete: () {
                                FirebaseFirestore.instance.collection('users')
                                    .doc(user!.phoneNumber).collection('notifications')
                                    .doc( streamSnapshot.data!.docs[0].id).delete();

                                Navigator.pop(context);
                                showFlushbar(context, notification['title'], ' удалено.');
                              },
                            );
                          }
                      );
                    },
                  ),
                );
              },
            );
          } return SizedBox();
        },
      ),
    );
  }

  void setState(Null Function() param0) {}
}