import 'package:flutter/material.dart';

class ModalReceipt extends StatefulWidget {
  @override
  _ModalReceiptState createState() => _ModalReceiptState();
}

class _ModalReceiptState extends State<ModalReceipt> {
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
                  flex: 7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Название квитанции'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF222222)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '21.02.2018',
                            style: TextStyle(fontSize: 18.0, color: Color(0xFF2280CE)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Container(
                        width: 45,
                        height: 45,
                        margin: EdgeInsets.only(right: 10),
                        child: Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
                          color: Color(0xFF2280CE),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              print("tapped to download");
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.file_download,
                                color: Color(0xFFFFFFFF),
                              ),
                              iconSize: 25,
                              splashColor: Color(0xFF42A1F0),
                              onPressed: () {},
                            ),
                          ),
                        )),
                    Container(
                        width: 45,
                        height: 45,
                        margin: EdgeInsets.only(right: 1),
                        child: Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
                          color: Color(0xFFD31717),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              print("tapped to delete");
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: Color(0xFFFFFFFF),
                              ),
                              iconSize: 25,
                              splashColor: Color(0xFFEC3636),
                              onPressed: () {},
                            ),
                          ),
                        )),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Процедура: Магниторезонансная томография',
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF979797)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Способ оплаты:',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFF979797)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Container(
                      width: 32,
                      height: 20,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/balance/card.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Mastercard',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF222222)),
                          ),
                          Container(
                            child: Text(
                              '0000 ** 0000',
                              style: TextStyle(fontSize: 15.0, color: Color(0xFF979797)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Стоимость:',
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF222222)),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '3500 руб',
                      style: TextStyle(
                          fontSize: 34.0, fontWeight: FontWeight.w700, color: Color(0xFF2280CE)),
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
