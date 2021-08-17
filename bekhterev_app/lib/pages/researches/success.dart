import 'package:bekhterev_app/pages/researches/view/success_content.dart';
import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';

class SuccessForm extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  SuccessForm({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SuccessForm());
  }

  @override
  _SuccessFormState createState() => _SuccessFormState();
}

class _SuccessFormState extends State<SuccessForm> {
  late Widget bodyWidgetMain;

  Widget bodySuccess() {
    return SuccessContent();
  }

  @override
  void initState() {
    super.initState();
    bodyWidgetMain = bodySuccess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Запись на приём'),
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
