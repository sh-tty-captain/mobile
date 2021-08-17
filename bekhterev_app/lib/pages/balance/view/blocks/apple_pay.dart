import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bekhterev_app/pages/balance/inner/add_apple_pay.dart';

class ApplePay extends StatefulWidget {
  @override
  _ApplePayState createState() => _ApplePayState();
}

class _ApplePayState extends State<ApplePay> {
  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width * 0.65;

    return Material(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
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
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: textWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Пополнить',
                        style: TextStyle(fontSize: 15.0, color: Color(0xFF252525)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Apple Pay'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w500, color: Color(0xFF252525)),
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
                  child: Icon(Icons.add, size: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: IconSlideAction(
                caption: 'Скрыть',
                color: Color(0xFF2280CE),
                icon: Icons.archive,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color(0x99222222),
                      content: Text('Уведомление скрыто.'),
                    ),
                  );
                },
              ),
            ),
          ],
          secondaryActions: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: IconSlideAction(
                caption: 'Удалить',
                color: Color(0xFFD31717),
                icon: Icons.delete,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color(0x99222222),
                      content: Text('Уведомление удалено.'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        splashColor: Color(0xFFF8D17F),
        highlightColor: Color(0x80F5F6F7),
        onTap: () {
          print("Tapped to Bank Card.");

          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => AddBalanceApplePay(),
              opaque: true,
              barrierColor: Colors.grey,
              transitionDuration: Duration(milliseconds: 290),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
