import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/pages/balance/inner/view/add_apple_pay_content.dart';

class AddBalanceApplePay extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  AddBalanceApplePay({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AddBalanceApplePay());
  }

  @override
  _AddBalanceApplePayState createState() => _AddBalanceApplePayState();
}

class _AddBalanceApplePayState extends State<AddBalanceApplePay> {
  late Widget bodyWidgetMain;

  Widget bodyBalanceApplePay() {
    return AddBalanceApplePayContent();
  }

  @override
  void initState() {
    super.initState();
    bodyWidgetMain = bodyBalanceApplePay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пополнение баланса Apple Pay'),
        centerTitle: false,
        backgroundColor: Color(0xFF2280CE),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: bodyWidgetMain,
      bottomNavigationBar: BottomNav(),
      floatingActionButton: BottomNavHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
