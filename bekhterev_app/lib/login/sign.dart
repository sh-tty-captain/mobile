import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/home/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final globalKey = GlobalKey<ScaffoldState>();

  String _message = '';
  late String _verificationId;
  late ConfirmationResult webConfirmationResult;

  bool _validate = false;
  bool _validateSms = false;

  Future<bool> _onWillPop() async {
    return (await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false)) ??
        false;
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Проверочный код:'),
            content: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child:
              Container(
                width: 235.0,
                child: InputDefaultLayout(
                  controller: _smsController,
                  label: 'Код проверки',
                  maxLength: 6,
                  error: _validateSms ? 'Поле не может быть пустым.' : null,
                  type: TextInputType.phone,
                  icon: Icon(
                    Icons.dialpad,
                    color: Color(0xF22280CE),
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ButtonLayout(
                      title: 'Войти',
                      onTap: () {
                        _signInWithPhoneNumber();

                        _smsController.text.isEmpty ? _validateSms = true : _validateSms = false;
                      }
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
            ],
          );
        }
    );
  }

  otpDialogBoxWeb(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Проверочный код:'),
            content: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                width: 235.0,
                child: InputDefaultLayout(
                  controller: _smsController,
                  maxLength: 6,
                  label: 'Код проверки',
                  error: _validateSms ? 'Поле не может быть пустым' : null,
                  type: TextInputType.phone,
                  icon: Icon(
                    Icons.call,
                    color: Color(0xF22280CE),
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child:
                    ButtonLayout(
                        title: 'Войти',
                        onTap: () {
                          _smsController.text.isEmpty ? _validateSms = true : _confirmCodeWeb();
                        }
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: globalKey,
        body: Align(
          alignment: Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 96,
                      height: 148,
                      margin: EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/login/logo.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 260.0,
                      child: InputDefaultLayout(
                        controller: _phoneNumberController,
                        formatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          _mobileFormatter,
                        ],
                        label: 'Номер телефона',
                        error: _validate ? 'Поле не может быть пустым' : null,
                        type: TextInputType.phone,
                        icon: Icon(
                          Icons.call,
                          color: Color(0xF22280CE),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ButtonLayout(
                        title: 'Получить код',
                        size: Size(260, 50),
                        onTap: () {
                          if (kIsWeb) {
                            _phoneNumberController.text.isEmpty ? _validate = true : _verifyWebPhoneNumber();
                          } else {
                            _verifyPhoneNumber();

                            _phoneNumberController.text.isEmpty ? _validate = true : otpDialogBox(context).then((value) {});
                          }
                        }
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: ButtonLayout(
                        title: 'Войти через Госулуги',
                        // ignore: unnecessary_null_comparison
                        onTap: null,
                        color: Color(0xFF2280CE),
                        tapColor: Color(0xFF3599EC),
                        textStyle: TextStyle(fontSize: 16.0),
                        size: Size(260, 50),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Visibility(
                      visible: _message != null,
                      child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          _message,
                          style: const TextStyle(color: Color(0xFFD31717)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyWebPhoneNumber() async {
    ConfirmationResult confirmationResult =
    await _auth.signInWithPhoneNumber(_phoneNumberController.text);

    webConfirmationResult = confirmationResult;

    if (webConfirmationResult != null) {
      otpDialogBoxWeb(context).then((value) {});
    }
  }

  Future<void> _confirmCodeWeb() async {
    if (webConfirmationResult != null) {
      try {
        await webConfirmationResult.confirm(_smsController.text);

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            HomePage()), (Route<dynamic> route) => false);
      } catch (e) {
        showFlushbar(context, 'Ошибка входа: ', e.toString());
      }
    } else {
      showFlushbar(context, 'Пожалуйста, введите', ' код проверки.');
    }
  }

  // Example code of how to verify phone number
  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      showFlushbar(context, 'Номер телефона пользователя ${phoneAuthCredential} ', 'успешно проверен.');
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        _message =
        'Ошибка проверки номера телефона. Код: ${authException.code}. Сообщение: ${authException.message}';
      });
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
          showFlushbar(context, 'Пожалуйста, проверьте СМС: ', 'код был успешно отправлен.');
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: _phoneNumberController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showFlushbar(context, 'Ошибка проверки номера телефона: ', e);
    }
  }

  // Example code of how to sign in with phone.
  Future<void> _signInWithPhoneNumber() async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsController.text,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;

      showFlushbar(context, 'Успешный вход пользователя: ', user!.uid);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomePage()), (Route<dynamic> route) => false);
    } catch (e) {
      print(e);
      showFlushbar(context, 'Ошибка ', 'входа.');
    }
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 1;
    final newTextBuffer = StringBuffer();

    if (newTextLength >= 1) {
      if (newValue.text.startsWith(RegExp(r'[789]'))) {
        newTextBuffer.write('+7');
        if (newValue.text.startsWith('9')) {
          newTextBuffer.write('(9');
          selectionIndex = 4;
        }
        if (newValue.selection.end >= 1) selectionIndex++;
      }
    }

    if (newTextLength >= 2) {
      newTextBuffer.write('(' + newValue.text.substring(1, usedSubstringIndex = 2));
      if (newValue.selection.end >= 2) selectionIndex++;
    }
    if (newTextLength >= 5) {
      newTextBuffer
          .write(newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 4) + ')');
      if (newValue.selection.end >= 4) selectionIndex++;
    }
    if (newTextLength >= 8) {
      newTextBuffer
          .write(newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 7) + '-');
      if (newValue.selection.end >= 7) selectionIndex++;
    }
    if (newTextLength >= 10) {
      newTextBuffer
          .write(newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 9) + '-');
      if (newValue.selection.end >= 9) selectionIndex++;
    }

// Dump the rest.
    if (newTextLength > usedSubstringIndex)
      newTextBuffer.write(newValue.text.substring(usedSubstringIndex, newTextLength));

    return TextEditingValue(
      text: newTextBuffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

