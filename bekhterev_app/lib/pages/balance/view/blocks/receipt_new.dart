import 'package:flutter/material.dart';
import 'package:bekhterev_app/pages/balance/view/blocks/modal.dart';

class NewReceipt extends StatefulWidget {
  @override
  _NewReceiptState createState() => _NewReceiptState();
}

class _NewReceiptState extends State<NewReceipt> {
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Новая квитанция'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700, color: Color(0xFF222222)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        '21.02.2018',
                        style: TextStyle(fontSize: 15.0, color: Color(0xFF2280CE)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
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
            ],
          ),
        ),
        splashColor: Color(0xFFF8D17F),
        highlightColor: Color(0x80F5F6F7),
        onTap: () {
          print("Tapped.");

          showModalBottomSheet<void>(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return ModalReceipt();
              });
        },
      ),
    );
  }
}
