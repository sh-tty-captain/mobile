import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:bekhterev_app/pages/balance/view/blocks/bank_card.dart';
import 'package:bekhterev_app/pages/balance/view/blocks/apple_pay.dart';
import 'package:bekhterev_app/pages/balance/view/blocks/modal_privacy.dart';

class BalanceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double textWidth = MediaQuery.of(context).size.width * 0.6;

    return Column(
      children: [
        Container(
          height: 10,
          width: width,
          color: Color(0xFF2280CE),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
          height: 110,
          width: width,
          color: Color(0xFF42A1F0),
          child: Container(
            width: textWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Баланс'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Сейчас доступно, 05.02.2021',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '2058,59 руб'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE8C883),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
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
                      BankCard(),
                      ApplePay(),
                      SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 15.0, color: Color(0xFF252525)),
                          children: <TextSpan>[
                            TextSpan(text: 'Пополняя счет, вы принимаете условия '),
                            TextSpan(
                                text: 'пользовательского соглашения',
                                style: TextStyle(fontSize: 15.0, color: Color(0xFF2280CE)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Tapped to Privacy Policy');

                                    showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => ModalPrivacy(),
                                    );
                                  }),
                            TextSpan(
                              text: '.',
                              style: TextStyle(fontSize: 15.0, color: Color(0xFF252525)),
                            ),
                          ],
                        ),
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
