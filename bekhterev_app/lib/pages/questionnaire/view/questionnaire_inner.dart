import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:bekhterev_app/pages/questionnaire/view/blocks/test.dart';

class QuestionnairePageInner extends StatefulWidget {
  @override
  _QuestionnairePageInnerState createState() => _QuestionnairePageInnerState();
}

class _QuestionnairePageInnerState extends State<QuestionnairePageInner> {
  int selectedIndex = 3;

  bool isPressed = false;
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: 75,
          width: _width,
          color: Color(0xFF42A1F0),
        ),
        Container(
          height: _height,
          width: _width,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 75),
                  child: TabBar(
                    indicator: ShapeDecoration(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                        gradient: LinearGradient(colors: [Color(0xFFE8C883), Color(0xFFE8C883)])),
                    tabs: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: new Tab(text: 'Все'.toUpperCase()),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: new Tab(text: 'Пройденные'.toUpperCase()),
                      ),
                    ],
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    unselectedLabelStyle: TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 0, //extend the shadow
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            -4, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 15),
                      child: TabBarView(children: [
                        Container(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: 12,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 290),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: TestBlock(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 290),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: TestBlock(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
