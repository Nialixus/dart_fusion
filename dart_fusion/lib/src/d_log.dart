part of '../dart_fusion.dart';

/// Enumeration representing different log levels for debugging and logging purposes.
enum DLevel {
  /// Verbose level, providing detailed diagnostic information.
  verbose,

  /// Debug level, used for debugging information.
  debug,

  /// Info level, used for informative messages.
  info,

  /// Warning level, used to indicate potential issues or unexpected behaviors.
  warning,

  /// Error level, used to indicate errors that do not prevent the application from running.
  error,

  /// WTF (What a Terrible Failure) level, used to indicate critical errors or unexpected conditions.
  wtf,

  /// No log level, effectively suppressing all log messages.
  nothing,
}

/// A simple logging utility for printing log messages with customizable log levels.
class DLog {
  static final _logger = Logger(
    printer: _DLogPrinter(),
    level: Level.trace,
  );

  /// Creates a new [DLog] instance with the given [message] and optional [level].
  /// By default, the log level is set to [Level.info].
  ///
  /// Example:
  /// ```dart
  /// AppLog("This is a log message", level: Level.warning);
  /// ```
  DLog(this.message, {DLevel level = DLevel.info}) {
    if (level == DLevel.nothing) return;
    _logger.log(_mapLevel(level), message?.toString() ?? "No Message.");
  }

  /// The log message to be printed.
  final dynamic message;

  static Level _mapLevel(DLevel level) {
    switch (level) {
      case DLevel.verbose:
        return Level.values.firstWhere(
          (e) => e.name == 'trace' || e.name == 'verbose',
          orElse: () => Level.trace,
        );
      case DLevel.debug:
        return Level.debug;
      case DLevel.info:
        return Level.info;
      case DLevel.warning:
        return Level.warning;
      case DLevel.error:
        return Level.error;
      case DLevel.wtf:
        return Level.values.firstWhere(
          (e) => e.name == 'fatal' || e.name == 'wtf',
          orElse: () => Level.fatal,
        );
      case DLevel.nothing:
        return Level.values.firstWhere(
          (e) => e.name == 'off' || e.name == 'nothing',
          orElse: () => Level.off,
        );
    }
  }
}

/// The custom log printer for formatting log messages with colors based on the log level.
class _DLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    String color;
    String prefix;

    switch (event.level.name) {
      case 'trace':
      case 'verbose':
        color = "\x1b[37m";
        prefix = "VERBOSE";
        break;
      case 'debug':
        color = "\x1b[94m";
        prefix = "DEBUG";
        break;
      case 'info':
        color = "\x1b[32m";
        prefix = "INFO";
        break;
      case 'warning':
        color = "\x1b[33m";
        prefix = "WARNING";
        break;
      case 'error':
        color = "\x1b[91m";
        prefix = "ERROR";
        break;
      case 'fatal':
      case 'wtf':
        color = "\x1b[35m";
        prefix = "WTF";
        break;
      default:
        color = "\x1b[37m";
        prefix = "NOTHING";
    }

    // Reset color code to default after printing the log message
    String close = "\x1b[0m";

    // Format the log message with color and prefix
    String formattedMessage = "$color[$prefix] ${event.message}$close";

    // Replace newline characters with color and prefix for multiline log messages
    formattedMessage = formattedMessage.replaceAll("\n", "\n$color[$prefix] ");

    return [formattedMessage];
  }
}
