part of '../dart_fusion.dart';

/// A utility class for parsing mostly related to http request.
final class DParse {
  /// Parsing message of http method value like `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`, `POST` or `PUT`.
  ///
  /// ```dart
  /// HttpMethod method = HttpMethod.get;
  /// final message = DParse.httpMethodMessage(method.name);
  /// print(message); // 'Data successfully loaded'
  /// ```
  static String httpMethodMessage(String value) {
    switch (value.toUpperCase()) {
      case 'DELETE':
        return 'Data successfully deleted';
      case 'GET':
        return 'Data successfully loaded';
      case 'HEAD':
        return 'Headers successfully obtained';
      case 'OPTIONS':
        return 'Server options successfully retrieved';
      case 'PATCH':
        return 'Data successfully patched';
      case 'POST':
        return 'Data successfully created';
      case 'PUT':
        return 'Data successfully updated';
      default:
        return 'Method unidentified, use `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`, `POST` or `PUT` instead.';
    }
  }

  /// Parsing message of [statusCode] value, usually used when catching
  /// unsuitable response value.
  ///
  /// ```dart
  /// Response response = Response(...);
  /// final message = DParse.httpStatusMessage(response.statusCode);
  /// print(message); // 'Not Found: The requested resource could not be found'
  /// ```
  static String httpStatusMessage(int statusCode) {
    switch (statusCode) {
      case 100:
        return 'Continue: The server has received the request headers and the '
            'client should proceed to send the request body';
      case 101:
        return 'Switching Protocols: The requester has asked the server to '
            'switch protocols';
      case 200:
        return 'OK: The request was successful';
      case 201:
        return 'Created: The request was successfully fulfilled and a new '
            'resource was created';
      case 202:
        return 'Accepted: The request has been accepted for processing, but the'
            ' processing has not been completed';
      case 203:
        return 'Non-Authoritative Information: The server successfully '
            'processed the request, but is returning information that may be '
            'from another source';
      case 204:
        return 'No Content: The server successfully processed the request and '
            'is not returning any content';
      case 205:
        return 'Reset Content: The server successfully processed the request, '
            'but is not returning any content and requires that the requester '
            'reset the document view';
      case 206:
        return 'Partial Content: The server is delivering only part of the '
            'resource due to a range header sent by the client';
      case 300:
        return 'Multiple Choices: Indicates multiple options for the resource '
            'that the client may follow';
      case 301:
        return 'Moved Permanently: The resource has been permanently moved to a'
            ' new location';
      case 302:
        return 'Found: The resource has been temporarily moved to a different '
            'location';
      case 303:
        return 'See Other: The response to the request can be found under a '
            'different URI';
      case 304:
        return 'Not Modified: Indicates that the resource has not been modified'
            ' since the version specified by the request headers';
      case 307:
        return 'Temporary Redirect: The resource has been temporarily moved to '
            'another location';
      case 400:
        return 'Bad Request: The server cannot process the request due to a '
            'client error';
      case 401:
        return 'Unauthorized: Authentication is required and has failed or has '
            'not been provided';
      case 403:
        return 'Forbidden: The client does not have permission to access the '
            'requested resource';
      case 404:
        return 'Not Found: The requested resource could not be found';
      case 405:
        return 'Method Not Allowed: The requested method is not allowed for '
            'this resource';
      case 406:
        return 'Not Acceptable: The requested resource is capable of generating'
            ' only content not acceptable according to the Accept headers sent '
            'in the request';
      case 407:
        return 'Proxy Authentication Required: The client must first '
            'authenticate itself with the proxy';
      case 408:
        return 'Request Timeout: The server timed out waiting for the request';
      case 409:
        return 'Conflict: Indicates that the request could not be processed '
            'because of a conflict in the current state of the resource';
      case 410:
        return 'Gone: Indicates that the requested resource is no longer '
            'available';
      case 411:
        return 'Length Required: The request did not specify the length of its '
            'content';
      case 412:
        return 'Precondition Failed: The server does not meet one of the '
            'preconditions specified by the client';
      case 413:
        return 'Payload Too Large: The request is larger than the server is '
            'willing or able to process';
      case 414:
        return 'URI Too Long: The URI provided was too long for the server to '
            'process';
      case 415:
        return 'Unsupported Media Type: The server does not support the media '
            'type requested by the client';
      case 416:
        return 'Range Not Satisfiable: The requested range cannot be fulfilled';
      case 417:
        return 'Expectation Failed: The server cannot meet the requirements of '
            'the Expect request-header field';
      case 500:
        return 'Internal Server Error: The server encountered an unexpected '
            'condition';
      case 501:
        return 'Not Implemented: The server does not support the functionality '
            'required to fulfill the request';
      case 502:
        return 'Bad Gateway: The server, while acting as a gateway or proxy, '
            'received an invalid response from an inbound server';
      case 503:
        return 'Service Unavailable: The server is currently unable to handle '
            'the request due to a temporary overload or maintenance of the '
            'server';
      case 504:
        return 'Gateway Timeout: The server, while acting as a gateway or '
            'proxy, did not receive a timely response from an upstream server';
      case 505:
        return 'HTTP Version Not Supported: The server does not support the '
            'HTTP protocol version used in the request';
      default:
        return 'Unknown Status Code: The server returned an unrecognized status'
            ' code';
    }
  }

  static final _converters = <Type, dynamic Function(dynamic)>{};

  /// Register a custom converter for a specific type [T].
  ///
  /// This allows [to] to dynamically handle custom types and their [List] variants.
  ///
  /// ```dart
  /// DParse.register<User>((v) => User.fromJson(v));
  /// final user = DParse.to<User>(json); // Works!
  /// final users = DParse.to<List<User>>(jsonList); // Also works!
  /// ```
  static void register<T>(T Function(dynamic value) converter) {
    _converters[T] = (v) => converter(v);
    // Automatically register the List variant if it doesn't exist
    final listType = typeOf<List<T>>();
    if (!_converters.containsKey(listType)) {
      _converters[listType] = (v) => mayToList<T>(v);
    }
    // Also register the nullable variants if appropriate
    _converters[typeOf<T?>()] = (v) => converter(v);
    _converters[typeOf<List<T>?>()] = (v) => mayToList<T>(v);
  }

  /// Parsing message error of [Exception].
  ///
  ///  ```dart
  /// FormatException exception = FormatException('Unexpected end of input (at character 1)');
  /// final message = DParse.exceptionMessage(exception);
  /// print(message); // 'Data is not exist'
  /// ```
  static String exceptionMessage(dynamic value) {
    switch (value.toString()) {
      case 'FormatException: Unexpected end of input (at character 1)\n\n^\n':
        return 'Data does not exist';
      case 'Null check operator used on a null value':
        return 'Data does not exist';
      case 'Bad state: No element':
        return 'Data does not exist';
      default:
        return value.toString();
    }
  }

  static T to<T>(dynamic value, [T? onError]) {
    try {
      // 1. Fast path: If value is already T, return it (except for nulls if onError is provided).
      if (value is T && (value != null || onError == null)) return value;

      // 2. Type-based checks for clean, recursive primitive handling
      // Core types that should be returned as-is
      if (T == dynamic || T == Object) return value as T;
      if (T == num) return (mayToDouble(value) ?? (onError as num?) ?? 0.0) as T;

      // Primitives & Nullables
      if (T == int) return toInt(value, onError as int?) as T;
      if (T == typeOf<int?>()) return (mayToInt(value) ?? onError as int?) as T;
      if (T == double) return toDouble(value, onError as double?) as T;
      if (T == typeOf<double?>())
        return (mayToDouble(value) ?? onError as double?) as T;
      if (T == bool) return toBool(value, onError as bool?) as T;
      if (T == typeOf<bool?>())
        return (mayToBool(value) ?? onError as bool?) as T;
      if (T == String) return toText(value, onError as String?) as T;
      if (T == typeOf<String?>())
        return (mayToText(value) ?? onError as String?) as T;
      if (T == DateTime) return toDate(value, onError as DateTime?) as T;
      if (T == typeOf<DateTime?>())
        return (mayToDate(value) ?? onError as DateTime?) as T;

      // JSON & Maps
      if (T == JSON || T == Map<String, dynamic>) {
        return toJSON(value, onError as JSON?) as T;
      }
      if (T == typeOf<JSON?>() || T == typeOf<Map<String, dynamic>?>()) {
        return (mayToJSON(value) ?? onError as JSON?) as T;
      }

      // Recursive Lists (Must have defaults)
      if (T == typeOf<List<int>>()) {
        return toList<int>(value, onError as List<int>?) as T;
      }
      if (T == typeOf<List<int>?>()) {
        return (mayToList<int>(value) ?? onError as List<int>?) as T;
      }
      if (T == typeOf<List<double>>()) {
        return toList<double>(value, onError as List<double>?) as T;
      }
      if (T == typeOf<List<double>?>()) {
        return (mayToList<double>(value) ?? onError as List<double>?) as T;
      }
      if (T == typeOf<List<bool>>()) {
        return toList<bool>(value, onError as List<bool>?) as T;
      }
      if (T == typeOf<List<bool>?>()) {
        return (mayToList<bool>(value) ?? onError as List<bool>?) as T;
      }
      if (T == typeOf<List<String>>()) {
        return toList<String>(value, onError as List<String>?) as T;
      }
      if (T == typeOf<List<String>?>()) {
        return (mayToList<String>(value) ?? onError as List<String>?) as T;
      }
      if (T == typeOf<List<JSON>>()) {
        return toList<JSON>(value, onError as List<JSON>?) as T;
      }
      if (T == typeOf<List<JSON>?>()) {
        return (mayToList<JSON>(value) ?? onError as List<JSON>?) as T;
      }

      // Dynamic collections
      if (T == typeOf<List<dynamic>>()) {
        return toList<dynamic>(value, onError as List<dynamic>?) as T;
      }
      if (T == typeOf<List<dynamic>?>()) {
        return (mayToList<dynamic>(value) ?? onError as List<dynamic>?) as T;
      }
      if (T == typeOf<Map<dynamic, dynamic>>()) {
        return toMap<dynamic, dynamic>(
            value, onError as Map<dynamic, dynamic>?) as T;
      }
      if (T == typeOf<Map<dynamic, dynamic>?>()) {
        return (mayToMap<dynamic, dynamic>(value) ??
            onError as Map<dynamic, dynamic>?) as T;
      }

      // Nested Lists (Deep Recursion requested)
      if (T == typeOf<List<List<int>>>()) {
        return toList<List<int>>(value, onError as List<List<int>>?) as T;
      }
      if (T == typeOf<List<List<int>>?>()) {
        return (mayToList<List<int>>(value) ?? onError as List<List<int>>?) as T;
      }
      if (T == typeOf<List<List<String>>>()) {
        return toList<List<String>>(value, onError as List<List<String>>?) as T;
      }
      if (T == typeOf<List<List<String>>?>()) {
        return (mayToList<List<String>>(value) ??
            onError as List<List<String>>?) as T;
      }

      // Recursive Maps (Requested map<int>, map<double> so on)
      if (T == typeOf<Map<String, int>>()) {
        return toMap<String, int>(value, onError as Map<String, int>?) as T;
      }
      if (T == typeOf<Map<String, int>?>()) {
        return (mayToMap<String, int>(value) ?? onError as Map<String, int>?)
            as T;
      }
      if (T == typeOf<Map<String, double>>()) {
        return toMap<String, double>(value, onError as Map<String, double>?)
            as T;
      }
      if (T == typeOf<Map<String, double>?>()) {
        return (mayToMap<String, double>(value) ??
            onError as Map<String, double>?) as T;
      }
      if (T == typeOf<Map<String, bool>>()) {
        return toMap<String, bool>(value, onError as Map<String, bool>?) as T;
      }
      if (T == typeOf<Map<String, bool>?>()) {
        return (mayToMap<String, bool>(value) ?? onError as Map<String, bool>?)
            as T;
      }
      if (T == typeOf<Map<String, String>>()) {
        return toMap<String, String>(value, onError as Map<String, String>?)
            as T;
      }
      if (T == typeOf<Map<String, String>?>()) {
        return (mayToMap<String, String>(value) ??
            onError as Map<String, String>?) as T;
      }

      // 3. Fallback to Registry for custom types or string-based matching for complex generics
      final converter = _converters[T];
      if (converter != null) {
        return (converter(value) ?? onError) as T;
      }

      final typeStr = T.toString();


      // 4. Default dynamic handling for unregistered collections
      if (typeStr.startsWith('List')) {
        final isNullable = typeStr.endsWith('?');
        return (isNullable
            ? (mayToList(value) ?? onError)
            : toList(value, onError as List?)) as T;
      }
      if (typeStr.startsWith('Map')) {
        final isNullable = typeStr.endsWith('?');
        return (isNullable
            ? (mayToMap(value) ?? onError)
            : toMap(value, onError as Map?)) as T;
      }

      // 5. Last resort: return value if it matches, or handle fallback
      return (onError ?? (null is T ? null : value)) as T;
    } catch (e, s) {
      DLog({'error': e, 'stacktrace': s}.toString(), level: DLevel.error);
      if (onError is T) return onError;
      return onError as T;
    }
  }

  /// Helper to get a [Type] literal for complex generic types.
  static Type typeOf<U>() => U;


  static int toInt(dynamic value, [int? onError]) {
    return mayToInt(value) ?? onError ?? 0;
  }

  static double toDouble(dynamic value, [double? onError]) {
    return mayToDouble(value) ?? onError ?? 0.0;
  }

  static bool toBool(dynamic value, [bool? onError]) {
    return mayToBool(value) ?? onError ?? false;
  }

  static DateTime toDate(dynamic value, [DateTime? onError]) {
    return mayToDate(value) ?? onError ?? DateTime.now();
  }

  static String toText(dynamic value, [String? onError]) {
    return mayToText(value) ?? onError ?? '';
  }

  static JSON toJSON(dynamic value, [JSON? onError]) {
    return mayToJSON(value) ?? onError ?? <String, dynamic>{};
  }

  static List<U> toList<U extends dynamic>(dynamic value, [List<U>? onError]) {
    return mayToList<U>(value) ?? onError ?? <U>[];
  }

  static Map<U, V> toMap<U extends dynamic, V extends dynamic>(
    dynamic value, [
    Map<U, V>? onError,
  ]) {
    return mayToMap<U, V>(value) ?? onError ?? <U, V>{};
  }

  static int? mayToInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    final str = value?.toString() ?? '';
    return int.tryParse(str) ?? double.tryParse(str)?.toInt();
  }

  static double? mayToDouble(dynamic value) {
    if (value is double) return value;
    return double.tryParse(value?.toString() ?? '');
  }

  static JSON? mayToJSON(dynamic value) {
    if (value is JSON) return value;
    if (value is Map) {
      return <String, dynamic>{
        for (var entry in value.entries) entry.key.toString(): entry.value
      };
    }
    if (value is String) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is JSON) return decoded;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  static bool? mayToBool(dynamic value) {
    if (value is bool) return value;
    return bool.tryParse(value?.toString() ?? '');
  }

  static DateTime? mayToDate(dynamic value) {
    if (value is DateTime) return value;
    return DateTime.tryParse(value?.toString() ?? '');
  }

  static String? mayToText(dynamic value) {
    if (value is String) return value;
    return value?.toString();
  }

  static Map<U, V>? mayToMap<U extends dynamic, V extends dynamic>(
    dynamic value,
  ) {
    try {
      if (value != null) {
        if (value is Map<U, V>) return value;
        if (value is Map) {
          return <U, V>{
            for (var item in value.entries) to<U>(item.key): to<V>(item.value)
          };
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static List<U>? mayToList<U extends dynamic>(dynamic value) {
    try {
      if (value != null) {
        if (value is List<U>) return value;
        if (value is List) return <U>[for (var item in value) to<U>(item)];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
