part of '../../dart_fusion.dart';

/// Configuration class for defining Cross-Origin Resource Sharing (CORS) policies.
///
/// Use the [Cors] class to specify CORS policy settings for handling cross-origin requests in a Dart backend application.
class Cors extends DModel {
  /// Constructs a [Cors] instance with specified CORS policy settings.
  const Cors({
    this.accessControlAllowOrigin,
    this.accessControlAllowMethods,
    this.accessControlAllowHeaders,
    this.accessControlAllowCredentials,
    this.accessControlExposeHeaders,
    this.accessControlMaxAge,
  });

  Cors.byDefault()
      : this(
          accessControlAllowCredentials: false,
          accessControlAllowHeaders: [
            Header.accept,
            Header.acceptLanguage,
            Header.contentLanguage,
            Header.contentType,
          ],
          accessControlAllowMethods: [
            HttpMethod.get,
            HttpMethod.post,
            HttpMethod.head,
          ],
          accessControlAllowOrigin: ['*'],
          accessControlMaxAge: Duration(days: 1),
          accessControlExposeHeaders: [
            Header.xCustomHeader,
          ],
        );

  /// List of allowed origins for CORS requests.
  final List<String>? accessControlAllowOrigin;

  /// List of allowed HTTP methods for CORS requests.
  final List<HttpMethod>? accessControlAllowMethods;

  /// List of allowed headers for CORS requests.
  final List<Header>? accessControlAllowHeaders;

  /// Indicates whether credentials (such as cookies or HTTP authentication) are allowed for CORS requests.
  final bool? accessControlAllowCredentials;

  /// List of headers exposed to the browser in CORS responses.
  final List<Header>? accessControlExposeHeaders;

  /// Maximum duration (in seconds) that the CORS preflight response should be cached.
  final Duration? accessControlMaxAge;

  @override
  Cors copyWith({
    List<String>? accessControlAllowOrigin,
    List<HttpMethod>? accessControlAllowMethods,
    List<Header>? accessControlAllowHeaders,
    bool? accessControlAllowCredentials,
    List<Header>? accessControlExposeHeaders,
    Duration? accessControlMaxAge,
  }) {
    return Cors(
      accessControlAllowCredentials:
          accessControlAllowCredentials ?? this.accessControlAllowCredentials,
      accessControlAllowHeaders:
          accessControlAllowHeaders ?? this.accessControlAllowHeaders,
      accessControlAllowMethods:
          accessControlAllowMethods ?? this.accessControlAllowMethods,
      accessControlAllowOrigin:
          accessControlAllowOrigin ?? this.accessControlAllowOrigin,
      accessControlExposeHeaders:
          accessControlExposeHeaders ?? this.accessControlExposeHeaders,
      accessControlMaxAge: accessControlMaxAge ?? this.accessControlMaxAge,
    );
  }

  static Cors fromJSON(JSON value) {
    return Cors(
      accessControlAllowCredentials:
          value.of<String?>('access-control-allow-credentials')?.tryToBool(),
      accessControlAllowOrigin:
          value.of<String?>('access-control-allow-origin')?.split(', '),
      accessControlAllowMethods: value
          .of<String?>('access-control-allow-methods')
          ?.split(', ')
          .map(
            (e) => HttpMethod.values.firstWhere(
              (f) => f.name.toUpperCase() == e.toUpperCase(),
              orElse: () => HttpMethod.options,
            ),
          )
          .toList(),
      accessControlMaxAge:
          value.of<String?>('access-control-max-age')?.tryToDuration(),
      accessControlAllowHeaders: value
          .of<String?>('access-control-allow-headers')
          ?.replaceAll('-', '')
          .split(', ')
          .map((e) => Header.fromJSON({'model_type': e}))
          .toList(),
      accessControlExposeHeaders: value
          .of<String?>('access-control-expose-headers')
          ?.replaceAll('-', '')
          .split(', ')
          .map((e) => Header.fromJSON({'model_type': e}))
          .toList(),
    );
  }

  @override
  JSON get toJSON {
    final acao = accessControlAllowOrigin;
    final acam = accessControlAllowMethods;
    final acah = accessControlAllowHeaders;
    final acac = accessControlAllowCredentials;
    final aceh = accessControlExposeHeaders;
    final acma = accessControlMaxAge;
    String toString(HttpMethod e) => e.name.toUpperCase();
    return {
      if (acao != null && acao.isNotEmpty)
        'access-control-allow-origin': acao.join(', '),
      if (acam != null && acam.isNotEmpty)
        'access-control-allow-methods': acam.map(toString).join(', '),
      if (acah != null && acah.isNotEmpty)
        'access-control-allow-headers': acah.join(', '),
      if (acac != null) 'access-control-allow-credentials': '$acac',
      if (aceh != null && aceh.isNotEmpty)
        'access-control-expose-headers': aceh.join(', '),
      if (acma != null) 'access-control-max-age': '${acma.inSeconds}',
    };
  }

  /// Convert type of [toJSON] method into a compatible header type.
  Map<String, Object> get toHeader => <String, Object>{...toJSON};

  /// Checks if the origin is allowed based on the CORS configuration.
  bool isOriginAllowed(
    RequestContext context, {
    required Cors cors,
  }) {
    final origin = context.request.headers['Origin'];
    final allowOrigin = cors.accessControlAllowOrigin;
    final isAllAllowed =
        allowOrigin == null || allowOrigin.contains('*') || allowOrigin.isEmpty;
    final isOneAllowed = allowOrigin != null &&
        allowOrigin.any((e) {
          if (origin != null) {
            final encode = e
                .replaceAll('.', r'\.')
                .replaceAll('/', r'\/')
                .replaceAll('*', '.*');
            return RegExp('^$encode\$').hasMatch(origin);
          } else {
            return false;
          }
        });
    return isAllAllowed || isOneAllowed;
  }

  /// Checks if the HTTP method is allowed based on the CORS configuration.
  bool isMethodAllowed(
    RequestContext context, {
    required Cors cors,
  }) {
    final allowMethod = cors.accessControlAllowMethods;
    final isAllAllowed = allowMethod == null || allowMethod.isEmpty;
    final isOneAllowed =
        allowMethod != null && allowMethod.contains(context.request.method);
    return isAllAllowed || isOneAllowed;
  }

  /// Checks if the headers are allowed based on the CORS configuration.
  bool isHeaderAllowed(
    RequestContext context, {
    required Cors cors,
  }) {
    final headers = [
      for (final key in context.request.headers.keys)
        Header.fromJSON({'model_type': key}),
    ];
    final allowHeader = cors.accessControlAllowHeaders;
    final isAllAllowed = allowHeader == null || allowHeader.isEmpty;
    final isOneAllowed =
        allowHeader != null && allowHeader.any(headers.contains);
    return isAllAllowed || isOneAllowed;
  }

  /// Checks if credentials are allowed based on the CORS configuration.
  bool isCredentialAllowed(
    RequestContext context, {
    required Cors cors,
  }) {
    final allowCredential = cors.accessControlAllowCredentials;
    final allowOrigin = cors.accessControlAllowOrigin;
    final isAllAlowed = allowCredential == null || allowCredential == false;
    final isOneAllowed = allowOrigin != null &&
        ((allowOrigin.contains('*') == false || allowOrigin.isNotEmpty)) &&
        allowCredential == true;
    return isAllAlowed || isOneAllowed;
  }

  /// Handler method to validate CORS policies and modify response headers.
  Handler handler(Handler handler) {
    String addOption(Map<String, Object> header) {
      String method = header['access-control-allow-methods']?.toString() ?? '';
      return method.contains('OPTIONS') ? method : method + ', OPTIONS';
    }

    return (context) async {
      try {
        final origin = context.request.headers['Origin'] ?? context.request.headers['origin'];
        if (origin == null) {
          return await handler(context);
        }

        var response = await handler(context);
        response = response.copyWith(
          headers: {
            ...Cors.byDefault().toHeader,
            ...toJSON,
            ...response.headers,
          },
        );

        final cors = Cors.fromJSON(response.headers);

        Assert.list(
          children: [
            response.assertion(
              isOriginAllowed(context, cors: cors),
              'Access denied for this origin.',
              statusCode: 403,
            ),
            response.assertion(
              isMethodAllowed(context, cors: cors),
              'Requested HTTP method is not allowed for this resource.',
              statusCode: 405,
            ),
            // Assert.response(
            //   isHeaderAllowed(context, cors: cors),
            //   'Requested headers are not allowed by the CORS policy.',
            //   statusCode: 403,
            // )
            response.assertion(
              isCredentialAllowed(context, cors: cors),
              'Conflict between Allow-Credentials and Allow-Origin.',
              statusCode: 500,
            ),
          ],
        );

        return response.copyWith(headers: {
          ...response.headers,
          'access-control-allow-origin': origin,
          'access-control-allow-methods': addOption(response.headers)
        });
      } on ResponseException catch (e) {
        final origin = context.request.headers['Origin'] ?? context.request.headers['origin'];
        if (origin == null) {
          return e.response;
        }
        final header = <String, Object>{
          ...Cors.byDefault().toHeader,
          ...toJSON,
          ...e.response.headers,
        };
        return e.response.copyWith(headers: {
          ...header,
          'access-control-allow-origin': origin,
          'access-control-allow-methods': addOption(header)
        });
      } catch (e) {
        throw e;
      }
    };
  }
}
