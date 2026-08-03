part of '../../dart_fusion.dart';

/// Extension on [String] to provide additional functionality.
extension StringExtension on String {
  /// Replaces occurrences of keys with their respective values from the provided map.
  ///
  /// [key] is a map of string keys and their corresponding values to replace in the string.
  ///
  /// Returns a new string with replaced values.
  String add({required Map<String, String> key}) =>
      key.entries.fold(this, (output, entry) {
        return output.replaceAll(entry.key, entry.value);
      });

  /// Capitalizes the first letter of the string.
  ///
  /// Returns the string with the first letter capitalized.
  ///
  /// ```dart
  /// String word = 'magnificent'.toCamelCase();
  /// print(word); // Magnificent
  /// ```
  String toCamelCase() {
    try {
      return this[0].toUpperCase() + substring(1, length);
    } catch (e) {
      return toString().toUpperCase();
    }
  }

  /// Checks whether the [String] adheres to the standard email format.
  ///
  /// Returns `true` if the [String] represents a valid email address,
  /// otherwise returns `false`.
  bool get isEmail {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$')
        .hasMatch(this);
  }

  /// Try parse [bool] from [String].
  ///
  /// Returns `null` if parsing fails.
  bool? tryToBool() => bool.tryParse(this);

  /// Parse [String] to [bool].
  ///
  /// If parsing fails, returns the provided [onError] value, or `false` if not specified.
  bool toBool([bool? onError]) => bool.tryParse(this) ?? onError ?? false;

  /// Try parse [DateTime] from [String].
  ///
  /// Returns `null` if parsing fails.
  DateTime? tryToDate() => DateTime.tryParse(this);

  /// Parse [String] to [DateTime].
  ///
  /// If parsing fails, returns the provided [onError] value, or the current date and time if not specified.
  DateTime toDate([DateTime? onError]) =>
      DateTime.tryParse(this) ?? onError ?? DateTime.now();

  /// Try parse [int] from [String].
  ///
  /// Returns `null` if parsing fails.
  int? tryToInt() => int.tryParse(this);

  /// Parse [String] to [int].
  ///
  /// If parsing fails, returns the provided [onError] value, or `0` if not specified.
  int toInt([int? onError]) => int.tryParse(this) ?? onError ?? 0;

  /// Try parse [double] from [String].
  ///
  /// Returns `null` if parsing fails.
  double? tryToDouble() => double.tryParse(this);

  /// Parse [String] to [double].
  ///
  /// If parsing fails, returns the provided [onError] value, or `0.0` if not specified.
  double toDouble([double? onError]) => double.tryParse(this) ?? onError ?? 0.0;

  /// Try parse [Duration] from [String].
  ///
  /// Returns `null` if parsing fails.
  ///
  /// Optional parameter [type] specifies the unit of the duration (default is [DurationType.seconds]).
  Duration? tryToDuration({DurationType type = DurationType.seconds}) =>
      int.tryParse(this)?.toDuration(type: type);

  /// Parse [String] to [Duration].
  ///
  /// If parsing fails, returns the provided [onError] value, or `Duration.zero` if not specified.
  ///
  /// Optional parameter [type] specifies the unit of the duration (default is [DurationType.seconds]).
  Duration toDuration({
    Duration? onError,
    DurationType type = DurationType.seconds,
  }) =>
      int.tryParse(this)?.toDuration(type: type) ?? onError ?? Duration.zero;
}
