import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class Logger {
  static LogLevel _logLevel = LogLevel.debug;

  static void setLogLevel(LogLevel level) {
    _logLevel = level;
  }

  static void debug(String message) {
    _log(LogLevel.debug, message);
  }

  static void info(String message) {
    _log(LogLevel.info, message);
  }

  static void warning(String message) {
    _log(LogLevel.warning, message);
  }

  static void error(String message) {
    _log(LogLevel.error, message);
  }

  static void _log(LogLevel level, String message) {
    if (level.index >= _logLevel.index) {
      final frame = StackTrace.current.toString().split("\n")[1];
      String formattedMessage =
          '[${DateTime.now()}] [${_logLevelToString(level)}] ${_getCaller(frame)}: $message';
      if (kDebugMode) {
        print(formattedMessage);
      }
      // Example: sendLogToServer(formattedMessage);
    }
  }

  static String _logLevelToString(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.warning:
        return 'WARNING';
      case LogLevel.error:
        return 'ERROR';
      default:
        return '';
    }
  }

  static String _getCaller(String frame) {
    final index = frame.indexOf(" (");
    return frame.substring(index + 2, frame.length - 1);
  }
}
