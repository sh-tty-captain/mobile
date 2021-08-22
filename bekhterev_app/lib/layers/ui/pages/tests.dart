import 'package:bekhterev_app/pages/questionnaire/view/testing_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bekhterev_app/components/components.dart';

import 'package:bekhterev_app/layers/blocs/pages/tests/tests_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';

import 'package:bekhterev_app/adapters/ui/tests.dart';
import 'package:bekhterev_app/layers/models/ui/tests.dart';
import 'package:bekhterev_app/layers/services/impl/tests.dart';
import 'package:bekhterev_app/layers/use_cases/impl/tests.dart';
import 'package:url_launcher/url_launcher.dart';

TestsBloc _bloc(BuildContext context) => BlocProvider.of(context);

class TestsPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestsBloc(
        TestsUseCaseImpl(
          TestsServiceImpl(),
          TestsAdapter(),
        ),
      )..add(OnLoad()),
      child: TestsPage(),
    );
  }
}

class TestsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => TestsPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестирование онлайн'),
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
      body: BlocBuilder<TestsBloc, TestsState>(
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
  final Tests data;

  const _Loaded(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabLayout(
      tabNew: _List(data.newTests),
      tabAll: _List(data.allTests),
    );
  }
}

class _List extends StatelessWidget {
  final Iterable<Test> data;

  const _List(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: Column(
        children: [
          _Tests()
        ],
      ),
    );
  }
}

class _Tests extends StatelessWidget {
  _launchURL() async {
    const url = 'https://docs.google.com/forms/d/1d2HXpQIJ2Y_wTG0CinSQXXWKvUdPNrpRZT6kI-8-Y5Y/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppListEntryLayout(
      sufix: AppFilledCircleIcon(icon: Icons.visibility),
      title: AppNormalHeader('Тест отношения к приему пищи'.toUpperCase()) ,
      subTitle: AppNormalText('Анонимное тестирование на 26 вопросов'),
      onTap: () {
        if (kIsWeb) {
          _launchURL();
        } else {
          Navigator.push(context, TestContent.route());
        }
      },
    );
  }
}
