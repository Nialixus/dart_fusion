part of '../../dart_fusion.dart';

/// Extension on numeric types (int, double) to add utility methods for limiting values within a specified range.
extension NumberExtension<Number extends num> on Number {
  /// Returns the greater of this number and [min]. If this number is less than [min], [min] will be returned.
  ///
  /// ```dart
  /// int min = 5.min(10);
  /// print(min); // 10
  /// ```
  Number min(Number min) => this < min ? min : this;

  /// Returns the lesser of this number and [max]. If this number is greater than [max], [max] will be returned.
  ///
  /// ```dart
  /// double max = 100.0.max(10.0);
  /// print(max); // 10.0
  /// ```
  Number max(Number max) => this > max ? max : this;

  /// Returns this number, clamped to the range of [min] to [max].
  ///
  /// If this number is less than [min], [min] will be returned.
  /// If this number is greater than [max], [max] will be returned.
  /// Otherwise, this number will be returned unchanged.
  ///
  /// ```dart
  /// int number = 75.limit(0, 100);
  /// print(number); // 75
  /// ```
  Number limit(Number min, Number max) => this < min
      ? min
      : this > max
          ? max
          : this;

  /// Converts the number to a human-readable string representing bytes, KB, MB, GB, or TB.
  ///
  /// Returns a string representation of the size in bytes, KB, MB, GB, or TB.
  ///
  /// ```dart
  /// int bytes = 1048576;
  /// String parse = bytes.toReadableBytes;
  /// print(parse); // "1.00 MB"
  /// ```
  String get toReadableBytes {
    if (this < 1024) {
      return '$this B';
    } else if (this < 1024 * 1024) {
      double sizeInKB = this / 1024;
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else if (this < 1024 * 1024 * 1024) {
      double sizeInMB = this / (1024 * 1024);
      return '${sizeInMB.toStringAsFixed(2)} MB';
    } else if (this < 1024.0 * 1024 * 1024 * 1024) {
      double sizeInGB = this / (1024.0 * 1024 * 1024);
      return '${sizeInGB.toStringAsFixed(2)} GB';
    } else {
      double sizeInTB = this / (1024.0 * 1024 * 1024 * 1024);
      return '${sizeInTB.toStringAsFixed(2)} TB';
    }
  }

  /// Converts the numeric value to a [Duration] based on the specified [DurationType].
  ///
  /// Returns a [Duration] based on the numeric value and the specified [type].
  /// The [type] parameter represents the desired unit for the duration.
  ///
  /// Example:
  /// ```dart
  /// int number = 100;
  /// Duration duration = number.toDuration(type: DurationType.seconds);
  /// ```
  Duration toDuration({DurationType type = DurationType.seconds}) {
    switch (type) {
      case DurationType.days:
        return Duration(days: this.toInt());
      case DurationType.hours:
        return Duration(hours: this.toInt());
      case DurationType.minutes:
        return Duration(minutes: this.toInt());
      case DurationType.seconds:
        return Duration(seconds: this.toInt());
      case DurationType.milliseconds:
        return Duration(milliseconds: this.toInt());
      case DurationType.microseconds:
        return Duration(microseconds: this.toInt());
    }
  }
}

/// Enum representing different units for duration.
enum DurationType {
  /// Represents days.
  days,

  /// Represents hours.
  hours,

  /// Represents minutes.
  minutes,

  /// Represents seconds.
  seconds,

  /// Represents milliseconds.
  milliseconds,

  /// Represents microseconds.
  microseconds,
}
