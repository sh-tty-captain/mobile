class AppError {
  final Object e;
  final StackTrace? stackTrace;

  const AppError(this.e, this.stackTrace);

  String get title => e.toString();

  String? get description {
    return null;
  }

  String getReport() {
    return '';
  }

  String getReportWithStackTrace() {
    if (stackTrace != null) {
      return '${getReport()}\n\n'
          'STACK TRACE\n\n'
          '$stackTrace';
    } else {
      return getReport();
    }
  }
}
