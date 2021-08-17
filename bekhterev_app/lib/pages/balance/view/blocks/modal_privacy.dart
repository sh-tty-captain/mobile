import 'package:flutter/material.dart';

class ModalPrivacy extends StatefulWidget {
  @override
  _ModalPrivacyState createState() => _ModalPrivacyState();
}

class _ModalPrivacyState extends State<ModalPrivacy> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width * 0.65;

    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: textWidth,
                    child: Text(
                      'Пользовательское соглашение'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700, color: Color(0xFF222222)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF979797)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Закрыть'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
