part of '../../dart_fusion.dart';

/// Extension on the Map<String, dynamic> value.
extension JSONExtension on JSON {
  /// Merge between one [JSON] to another, usefull for values with same key in
  /// a [JSON] structure.
  ///
  /// ```dart
  /// JSON json = {"primary": "1", "secondary": "2"};
  /// JSON anotherJSON = {"primary": "10", "tertiary": "3"};
  /// print(json.merge(anotherJSON)); // {"primary": "10", "secondary": "2", "tertiary": "3"}
  /// ```
  JSON merge(JSON other) {
    final result = <String, dynamic>{};

    for (final key in keys) {
      if (other.containsKey(key) && this[key] is JSON && other[key] is JSON) {
        result[key] = (this[key] as JSON).merge(other[key] as JSON);
      } else {
        result[key] = this[key];
      }
    }

    for (final key in other.keys) {
      if (!result.containsKey(key)) {
        result[key] = other[key];
      }
    }

    return result;
  }

  /// Parse `dynamic` value to given [T] with an optional [onError] fallback.
  ///
  ///  ```dart
  /// JSON value = {"primary": "1"};
  /// String primary = value.of<String>("primary");
  /// print(primary); // "1"
  /// String secondary = value.of<String>("secondary", "No Data");
  /// print(secondary); // "No Data"
  /// ```
  T of<T extends dynamic>(String key, [T? onError]) {
    return DParse.to<T>(this[key], onError);
  }

  /// Parse [FormData] fields to [JSON].
  JSON get toJSON {
    final data = <String, dynamic>{};
    for (final entry in entries) {
      final key = entry.key;
      final value = entry.value;
      if (key.contains('.')) {
        final parts = key.split('.');
        Map<String, dynamic> current = data;
        for (int i = 0; i < parts.length - 1; i++) {
          final part = parts[i];
          final existing = current[part];
          if (existing is Map<String, dynamic>) {
            current = existing;
          } else {
            final nextMap = <String, dynamic>{};
            current[part] = nextMap;
            current = nextMap;
          }
        }
        current[parts.last] = value;
      } else {
        data[key] = value;
      }
    }

    return data;
  }
}
