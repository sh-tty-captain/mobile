import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/components/styles.dart';

import 'package:bekhterev_app/layers/blocs/pages/receipts/receipts_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';

import 'package:bekhterev_app/adapters/ui/receipts.dart';
import 'package:bekhterev_app/layers/models/ui/receipts.dart';
import 'package:bekhterev_app/layers/services/impl/receipts.dart';
import 'package:bekhterev_app/layers/use_cases/impl/receipts.dart';

ReceiptsBloc _bloc(BuildContext context) => BlocProvider.of(context);

class ReceiptsPageAssemble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReceiptsBloc(
        ReceiptsUseCaseImpl(
          ReceiptsServiceImpl(),
          ReceiptsAdapter(),
        ),
      )..add(OnLoad()),
      child: ReceiptsPage(),
    );
  }
}

class ReceiptsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => ReceiptsPageAssemble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чеки оплаты'),
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
      body: BlocBuilder<ReceiptsBloc, ReceiptsState>(
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
  final Receipts data;

  const _Loaded(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabLayout(
      tabNew: _List(data.newReceipts),
      tabAll: _List(data.allReceipts),
    );
  }
}

class _List extends StatelessWidget {
  final Iterable<Receipt> data;

  const _List(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: AnimationLimiter(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
          children: data.map((receipt) => _Receipt(receipt)).toList(),
        ),
      ),
    );
  }
}

class _Receipt extends StatelessWidget {
  final Receipt data;

  const _Receipt(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppListEntryLayout(
      sufix: AppFilledCircleIcon(icon: Icons.visibility),
      title: data.isNew ? AppNormalHeader(data.title.toUpperCase()) : AppNormalHeader(data.title.toUpperCase(), color: Color(0xFF979797)),
      subTitle: data.isNew ? AppNormalText(data.date) : AppNormalText(data.date, color: Color(0xFF979797)),
      onTap: () {
        print('Tapped to ' + data.title + '.');

        showModalBottomSheet<void>(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return _ReceiptModal(data);
            });
      },
    );
  }
}

class _ReceiptModal extends StatelessWidget {
  final Receipt data;
  const _ReceiptModal(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalLayout(
      title: data.title,
      date: Text(
        data.date,
        style: Styles.dateModal,
      ),
      icon: AppFilledCircleTapIcon(
        icon: Icons.file_download,
        color: Color(0xFF2280CE),
        colorSplash: Color(0xFF42A1F0),
        onTap: () {
          print(data.title + " загружается.");
          Navigator.pop(context);
          showFlushbar(context, data.title, ' удалено.');
        },
      ),
      procedure: ProcedureLayout(procedureName: data.procedure),
      paymentMethod: PaymentMethodLayout(),
      cost: CostLayout(costData: data.cost),
    );
  }
}
