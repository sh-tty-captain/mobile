import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/pages/balance/inner/view/add_balance_card_content.dart';

class AddBalanceCard extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  AddBalanceCard({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AddBalanceCard());
  }

  @override
  _AddBalanceCardState createState() => _AddBalanceCardState();
}

class _AddBalanceCardState extends State<AddBalanceCard> {
  late Widget bodyWidgetMain;

  Widget bodyBalanceCard() {
    return AddBalanceCardContent();
  }

  @override
  void initState() {
    super.initState();
    bodyWidgetMain = bodyBalanceCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пополнение баланса Банковской картой'),
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
