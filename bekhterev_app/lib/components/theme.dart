import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      primaryColor: Color(0xFF2280CE),
      canvasColor: Color(0xFF2280CE),
      scaffoldBackgroundColor: Color(0xFFF5F6F7),
      fontFamily: 'Roboto',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE8C883),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          elevation: 2,
          textStyle: TextStyle(fontSize: 24.0),
          padding: EdgeInsets.only(top: 12, left: 40, right: 40, bottom: 12),
          minimumSize: Size(235, 50),
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
