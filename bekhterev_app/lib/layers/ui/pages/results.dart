import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/components/styles.dart';

import 'package:bekhterev_app/layers/blocs/pages/results/results_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';

import 'package:bekhterev_app/adapters/ui/results.dart';
import 'package:bekhterev_app/layers/models/ui/results.dart';
import 'package:bekhterev_app/layers/services/impl/results.dart';
import 'package:bekhterev_app/layers/use_cases/impl/results.dart';
import 'package:intl/intl.dart';

import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

import 'components/pdf_results.dart';

ResultsBloc _bloc(BuildContext context) => BlocProvider.of(context);

class ResultsPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultsBloc(
        ResultsUseCaseImpl(
          ResultsServiceImpl(),
          ResultsAdapter(),
        ),
      )..add(OnLoad()),
      child: ResultsPage(),
    );
  }
}

class ResultsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => ResultsPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результаты исследований'),
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
      body: BlocBuilder<ResultsBloc, ResultsState>(
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
  final Iterable<Result> data;

  const _Loaded(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageContainer(
      child: _List(data),
    );
  }
}

class _List extends StatelessWidget {
  final Iterable<Result> data;

  const _List(this.data, {Key? key}) : super(key: key);

  Future<Null> _refreshPage() async{
    print('Reload page.');

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Color(0xFFE8C883),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        _refreshPage();
      },
      child: _Result(),
    );
  }
}

class _Result extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  String formatTimestamp(Timestamp timestamp) {
    var format = new DateFormat('dd/MM/yyy HH:mm');
    return format.format(timestamp.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.phoneNumber)
            .collection('results')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              addRepaintBoundaries: false,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot result =
                streamSnapshot.data!.docs[index];

                return SladableLayout(
                  id: result['id'],
                  title: result['document'],
                  onTap: () {
                    showFlushbar(context, result['document'], ' удалено.');

                    FirebaseFirestore.instance.collection('users')
                        .doc(user!.phoneNumber).collection('results')
                        .doc( streamSnapshot.data!.docs[0].id).delete();
                  },

                  child: AppListEntryLayout(
                    sufix: AppFilledCircleIcon(icon: Icons.visibility),
                    title: AppNormalHeader(result['document'].toString().toUpperCase(), color: Color(0xFF222222)),
                    subTitle: AppNormalText(result['department'].toString(), color: Color(0xFF222222)),
                    onTap: () {
                      print('Tapped to ' + result['document'].toString() + '.');

                      // final id = FirebaseFirestore.instance.collection('users')
                      // .doc(user!.phoneNumber).collection('results')
                      // .doc( streamSnapshot.data!.docs[0].id);

                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalResults(
                              document: result['document'],
                              doctor: result['doctor'],
                              description: result['description'],
                              department: result['department'],
                              name: result['name'],
                              birthdate: result['birthdate'],
                              address: result['address'],
                              age: result['age'],
                              specialization: result['specialization'],
                              history: result['history'],
                              mkb: result['mkb'],
                              conclusion: result['conclusion'],
                              date: Text(
                                formatTimestamp(result['date']),
                                style: Styles.dateModal,
                              ),
                              download: () {
                                print(result['document'] + " загружается.");
                                Navigator.pop(context);
                                showFlushbar(context, result['document'], ' загружается.');
                              },
                              delete: () {
                                FirebaseFirestore.instance.collection('users')
                                    .doc(user!.phoneNumber).collection('results')
                                    .doc( streamSnapshot.data!.docs[0].id).delete();

                                Navigator.pop(context);
                                showFlushbar(context, result['document'], ' удалено.');
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
}
