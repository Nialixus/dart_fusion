part of '../../dart_fusion.dart';

/// An extension of [RequestContext].
extension OnRequestContext on RequestContext {
  /// A shortcut to get [HttpMethod] out of [RequestContext].
  HttpMethod get method => request.method;

  /// Check whether request method is [HttpMethod.get] or not.
  bool get isGET => method == HttpMethod.get;

  /// Check whether request method is [HttpMethod.post] or not.
  bool get isPOST => method == HttpMethod.post;

  /// Check whether request method is [HttpMethod.delete] or not.
  bool get isDELETE => method == HttpMethod.delete;

  /// Check whether request method is [HttpMethod.put] or not.
  bool get isPUT => method == HttpMethod.put;

  /// Check whether request is a http request or websocket request.
  bool get isWebSocket =>
      request.headers['Upgrade']?.toLowerCase() == 'websocket';

  /// A shortcut to get parameter from [RequestContext].
  JSON get parameter => request.uri.queryParameters;

  /// A shortcut to get request header from [RequestContext].
  JSON get header => request.headers;

  /// A function to verifiy `Bearer Token`.
  Future<JWT> verify(String Function(String key) certificate) async {
    try {
      final token = request.headers['authorization']!.split(' ').last;
      final key = JWT.decode(token).header!['kid'].toString();
      return JWT.verify(token, RSAPublicKey.cert(certificate(key)));
    } catch (e) {
      throw ResponseException(
        response: Response.json(
          statusCode: 401,
          body: ResponseModel(
            message: DParse.httpStatusMessage(401),
          ).toJSON,
        ),
      );
    }
  }
}
