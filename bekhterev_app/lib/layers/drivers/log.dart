import 'package:flutter/widgets.dart';

void logUiAction(String tag, String message, BuildContext context) {
  log(tag, context.describeOwnershipChain(message).toString());
}

void log(String tag, dynamic message) {
  final logEntry = '[${tag.toUpperCase()}] $message';
  debugPrint(logEntry);
}
