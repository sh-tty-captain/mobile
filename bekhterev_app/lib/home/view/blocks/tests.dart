import 'package:flutter/material.dart';
import 'package:bekhterev_app/layers/ui/pages/tests.dart';

class TestsBlock extends StatefulWidget {
  @override
  _TestsBlockState createState() => _TestsBlockState();
}

class _TestsBlockState extends State<TestsBlock> {
  @override
  Widget build(BuildContext context) {
    double _textWidth = MediaQuery.of(context).size.width * 0.53;

    return Material(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Icon(Icons.assignment_outlined, size: 45, color: Color(0xFF222222)),
              ),
              SizedBox(width: 15),
              Container(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Тестирования Онлайн'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700, color: Color(0xFF222222)),
                    ),
                    Text(
                      'Тесты на психологическое состояния; анкетирование',
                      style: TextStyle(fontSize: 15.0, color: Color(0xFF222222)),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(right: 1),
                decoration: BoxDecoration(
                  color: Color(0xFF2280CE),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Icon(Icons.visibility, size: 25, color: Colors.white),
              ),
            ],
          ),
        ),
        splashColor: Color(0xFFF8D17F),
        highlightColor: Color(0x80F5F6F7),
        onTap: () {
          print("Tapped to Tests.");

          Navigator.push(context, TestsPage.route());
        },
      ),
    );
  }
}
