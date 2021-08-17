import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/pages/questionnaire/view/questionnaire_inner.dart';

class QuestionnairePage extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  QuestionnairePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => QuestionnairePage());
  }

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  late Widget bodyWidgetMain;

  Widget bodyQuestionnaire() {
    return QuestionnairePageInner();
  }

  @override
  void initState() {
    super.initState();
    bodyWidgetMain = bodyQuestionnaire();
  }

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
