part of 'components.dart';

void showFlushbar(BuildContext context, title, mes) {
  Flushbar(
    message: title + mes,
    messageSize: 18,
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Color(0xF22280CE),
    isDismissible: true,
    duration: Duration(seconds: 4),
    icon: Icon(
      Icons.announcement_outlined,
      color: Colors.white,
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Color(0xFFE8C883),
  ).show(context);
}