part of '../../dart_fusion.dart';

/// A specialized [Assert] class for handling response-related assertions.
///
/// The [ResponseAssert] class extends [Assert] and introduces functionality
/// to handle assertions related to HTTP responses, including status code checks.
class ResponseAssert extends Assert {
  /// Constructs a [ResponseAssert] with the provided [assertion], [message], and [statusCode].
  ///
  /// The [statusCode] parameter sets the HTTP status code for the response
  /// if the assertion fails. The default status code is 400 (Bad Request).
  ResponseAssert(bool assertion, String message, {this.statusCode = 400})
      : super(assertion, message);

  /// The HTTP status code for the response if the assertion fails.
  final int statusCode;

  @override
  void _run() {
    if (!assertion) {
      throw ResponseException(
        response: Response.json(
          statusCode: statusCode,
          body: ResponseModel(
            message: message,
          ).toJSON,
        ),
      );
    }
  }

  @override
  JSON get toJSON => {
        'status_code': statusCode,
        ...super.toJSON,
      };

  static ResponseAssert fromJSON(JSON value) {
    return ResponseAssert(
      value.of('assertion', true),
      value.of('message'),
      statusCode: value.of('status_code', 400),
    );
  }

  @override
  ResponseAssert copyWith({
    bool? assertion,
    String? message,
    int? statusCode,
  }) {
    return ResponseAssert(
      assertion ?? this.assertion,
      message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}