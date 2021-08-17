import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/pages/balance/view/cheque_content.dart';

class ChequePage extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  ChequePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ChequePage());
  }

  @override
  _ChequePageState createState() => _ChequePageState();
}

class _ChequePageState extends State<ChequePage> {
  late Widget bodyWidgetMain;

  Widget bodyCheque() {
    return ChequeContent();
  }

  @override
  void initState() {
    super.initState();
    bodyWidgetMain = bodyCheque();
  }

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
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE8C883),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              elevation: 2,
              textStyle: TextStyle(fontSize: 24.0),
              padding: EdgeInsets.only(top: 12, left: 40, right: 40, bottom: 12),
              minimumSize: Size(235, 50),
            ),
          ),
        ),
        child: bodyWidgetMain,
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: BottomNavHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
