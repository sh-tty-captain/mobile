import 'package:flutter/material.dart';

class AddBalanceApplePayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 35,
          width: width,
          color: Color(0xFF2280CE),
        ),
        Container(
          child: Expanded(
            child: Container(
              width: width,
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 10.0, // soften the shadow
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
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Страница пополнения баланса Apple Pay.',
                        style: TextStyle(fontSize: 15.0, color: Color(0xFF252525)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
