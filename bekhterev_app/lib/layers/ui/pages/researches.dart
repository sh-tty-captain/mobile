import 'package:bekhterev_app/components/styles.dart';
import 'package:bekhterev_app/layers/models/ui/researches.dart';
import 'package:bekhterev_app/layers/services/api_gateway/impl/api_gateway.dart';
import 'package:bekhterev_app/pages/researches/success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bekhterev_app/components/components.dart';

import 'package:bekhterev_app/layers/blocs/pages/researches/researches_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/adapters/ui/researches.dart' as ui;
import 'package:bekhterev_app/adapters/domain/researches.dart' as domain;
import 'package:bekhterev_app/layers/services/impl/researches.dart';
import 'package:bekhterev_app/layers/use_cases/impl/researches.dart';

ResearchesBloc _bloc(BuildContext context) => BlocProvider.of(context);

class ResearchPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResearchesBloc(
        ResearchesUseCaseImpl(
          ResearchesServiceImpl(
            ApiGatewayImpl(),
            domain.ResearchesAdapter(),
          ),
          ui.ResearchesAdapter(),
        ),
      )..add(OnLoad()),
      child: ResearchPage(),
    );
  }
}

class ResearchPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => ResearchPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Запись на исследование'),
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
      body: BlocBuilder<ResearchesBloc, ResearchesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return _Loading();
          } else if (state is LoadingErrorState) {
            return _LoadingError(state.error);
          } else if (state is LoadedState) {
            return _Loaded(state);
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
  final LoadedState state;

  const _Loaded(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF42A1F0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 15),
                child: SingleChildScrollView(
                  child: _Form(state),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  final LoadedState state;

  const _Form(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Name(),
        SizedBox(height: 15),
        _Specializations(state.data),
        if (state.data.doctors.isNotEmpty) ...[
          SizedBox(height: 15),
          _Doctors(state.data),
        ],
        if (state.data.availableAppointments.isNotEmpty) ...[
          SizedBox(height: 15),
          _AvaibleAppointments(state.data),
        ],
        if (state.data.activeButton?.isActive != null) ...[
          SizedBox(height: 20),
          _ButtonSend(state.data),
        ],
        if (state is LoadingUpdateFormState)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void setState(Null Function() param0) {}
}

class _Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<_Name> {
  final textController = TextEditingController();

  final User? user = FirebaseAuth.instance.currentUser;
  final _users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
                textController.text = documentSnapshot['name'];

                return InputWhiteLayout(
                  controller: textController,
                  label: 'Ваше имя',
                  placeholder: 'Введите ФИО',
                );
              } else if (documentSnapshot['phone'] != null) {
                return SizedBox();
              }
              return SizedBox();
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFE8C883))),
        );
      },
    );
  }
}

class _Specializations extends StatelessWidget {
  final ResearchForm data;

  const _Specializations(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownWhiteLayout<Specialization>(
      labelForm: 'Выберите специальность направления:',
      hint: 'Доступные направления',
      value: data.selectedSpecialization,
      onChanged: (value) => _bloc(context).add(OnSelectSpecialization(value.id)),
      items: data.specializations.map((specialization) {
        return DropdownMenuItem(
          value: specialization,
          child: Text(specialization.name, style: Styles.hintWhite),
        );
      }).toList(),
    );
  }

  void setState(Null Function() param0) {}
}

class _Doctors extends StatelessWidget {
  final ResearchForm data;

  const _Doctors(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownWhiteLayout(
      labelForm: 'Выберите врача:',
      hint: 'Свободные специалисты',
      items: data.doctors.map((doctor) {
        return DropdownMenuItem(
          value: doctor,
          child: Row(
            children: [
              Text(
                doctor.name,
                style: Styles.hintWhite,
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        assert(value is Doctor);
        final d = value as Doctor;
        _bloc(context).add(OnSelectDoctor(d.id));
      },
    );
  }

  void setState(Null Function() param0) {}
}

class _AvaibleAppointments extends StatelessWidget {
  final ResearchForm data;

  const _AvaibleAppointments(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownWhiteLayout(
      labelForm: 'Выберите удобное время:',
      hint: 'Свободные талоны',
      items: data.availableAppointments.map((appointments) {
        return DropdownMenuItem(
          value: appointments,
          child: Row(
            children: [
              Text(
                appointments.dateTime,
                style: Styles.hintWhite,
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        assert(value is AvailableAppointment);
        final a = value as AvailableAppointment;
        _bloc(context).add(OnSelectAppointmentTime(a.id));
      },
    );
  }

  void setState(Null Function() param0) {}
}

class _ButtonSend extends StatelessWidget {
  final ResearchForm data;

  const _ButtonSend(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.activeButton!.isActive,
      child: Container(
        alignment: Alignment.center,
        child: ButtonLayout(
          title: 'Записаться',
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SuccessForm()),
                    (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
