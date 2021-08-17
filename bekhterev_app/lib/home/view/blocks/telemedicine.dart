import 'package:flutter/material.dart';
import 'package:bekhterev_app/pages/telemedicine/telemedicine_page.dart';

class TelemedicineBlock extends StatefulWidget {
  @override
  _TelemedicineBlockState createState() => _TelemedicineBlockState();
}

class _TelemedicineBlockState extends State<TelemedicineBlock> {
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
                child: Icon(Icons.photo_camera_front, size: 45, color: Color(0xFF222222)),
              ),
              SizedBox(width: 15),
              Container(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Телемедицинская консультация'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700, color: Color(0xFF222222)),
                    ),
                    Text(
                      'Онлайн видеоконференция с лечащим врачом',
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
          print("Tapped to Telemedicine.");

          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder:
                      (BuildContext context, Animation animation, Animation secondaryAnimation) {
                    return TelemedicinePage();
                  },
                  opaque: true,
                  barrierColor: Colors.grey,
                  transitionDuration: Duration(milliseconds: 290),
                  transitionsBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation, Widget child) {
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
                  }));
        },
      ),
    );
  }
}
