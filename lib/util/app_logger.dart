import 'package:logger/logger.dart';

class AppLogger {
  static final logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(
      methodCount: 0,
      // Number of method calls to be displayed
      errorMethodCount: 8,
      // Number of method calls if stacktrace is provided
      lineLength: 120,
      // Width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: false, // Should each log print contain a timestamp
    ), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  static void t(dynamic message) {
    logger.t(message);
  }

  static void d(dynamic message) {
    logger.d(message);
  }

  static void i(dynamic message) {
    logger.i(message);
  }

  static void w(dynamic message) {
    logger.w(message);
  }

  static void e(dynamic message) {
    logger.e(message);
  }

  static void f(dynamic message) {
    logger.f(message);
  }
}
