import 'dart:core';
import 'dart:async';
import 'package:bekhterev_app/login/sign.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double percent = 15.0;

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      print('Percent Update');

      if (mounted)
        setState(() {
          percent += 8;
          if (percent >= 100) {
            timer.cancel();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                LoginPage()), (Route<dynamic> route) => false);
          }
        });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height;
    double _width;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: CircularProgressIndicator(
                    value: percent / 100,
                    // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(Color(0xFFE8C883)),
                    backgroundColor: Color(0xFFFFFFFF),
                    strokeWidth: 3,
                  ),
                ),
                Container(
                  height: 135,
                  width: 88,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/loading/logo.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
