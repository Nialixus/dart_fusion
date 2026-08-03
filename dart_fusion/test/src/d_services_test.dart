import 'package:test/test.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_fusion/dart_fusion.dart';

class TestRequestContext implements RequestContext {
  @override
  final Request request;

  TestRequestContext(this.request);

  RequestContext copyWith({Request? request}) {
    return TestRequestContext(request ?? this.request);
  }

  Object? operator [](String key) => null;

  @override
  RequestContext provide<T extends Object?>(T Function() create) {
    return this;
  }

  @override
  T read<T>() {
    throw UnimplementedError();
  }

  @override
  Map<String, String> get mountedParams => {};
}

void main() {
  group('Cors Middleware Tests', () {
    test(
        'Request without Origin header is allowed through without CORS headers',
        () async {
      final cors = const Cors(
        accessControlAllowOrigin: ['http://allowed.com'],
      );
      final middleware =
          cors.handler((context) => Response.json(body: {'status': 'ok'}));

      final req = Request('GET', Uri.parse('http://localhost/api'));
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 200);
      expect(response.headers['access-control-allow-origin'], isNull);
    });

    test('Request with allowed Origin is accepted and receives CORS headers',
        () async {
      final cors = const Cors(
        accessControlAllowOrigin: ['*.allowed.com'],
        accessControlAllowMethods: [HttpMethod.get, HttpMethod.post],
      );
      final middleware =
          cors.handler((context) => Response.json(body: {'status': 'ok'}));

      final req = Request('GET', Uri.parse('http://localhost/api'), headers: {
        'Origin': 'http://sub.allowed.com',
      });
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 200);
      expect(response.headers['access-control-allow-origin'],
          'http://sub.allowed.com');
      expect(response.headers['access-control-allow-methods'], contains('GET'));
      expect(response.headers['access-control-allow-methods'],
          contains('OPTIONS'));
    });

    test('Request with disallowed Origin is rejected with 403 Forbidden',
        () async {
      final cors = const Cors(
        accessControlAllowOrigin: ['http://allowed.com'],
      );
      final middleware =
          cors.handler((context) => Response.json(body: {'status': 'ok'}));

      final req = Request('GET', Uri.parse('http://localhost/api'), headers: {
        'Origin': 'http://disallowed.com',
      });
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 403);

      final body = await response.json() as Map<String, dynamic>;
      expect(body['message'], contains('Access denied for this origin'));
    });
  });

  group('DMiddleware Tests', () {
    test('Successful response is wrapped in ResponseModel', () async {
      final dMiddleware = DMiddleware();
      final middleware =
          dMiddleware.handler((context) => Response.json(body: {'foo': 'bar'}));

      final req = Request('GET', Uri.parse('http://localhost/api'));
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 200);

      final body = await response.json() as Map<String, dynamic>;
      expect(body['success'], isTrue);
      expect(body['message'], equals('Data successfully loaded'));
      expect(body['data'], equals({'foo': 'bar'}));
    });

    test('WebSocket response is returned unmodified', () async {
      final dMiddleware = DMiddleware();
      final middleware = dMiddleware
          .handler((context) => Response(body: 'websocket-established'));

      final req = Request('GET', Uri.parse('http://localhost/ws'), headers: {
        'Upgrade': 'websocket',
      });
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 200);

      final body = await response.body();
      expect(body, 'websocket-established');
    });

    test('Error status code is wrapped in ResponseException', () async {
      final dMiddleware = DMiddleware();
      final middleware = dMiddleware.handler((context) => Response.json(
            statusCode: 404,
            body: {'reason': 'missing'},
          ));

      final req = Request('GET', Uri.parse('http://localhost/api'));
      final context = TestRequestContext(req);

      final response = await middleware(context);
      expect(response.statusCode, 404);

      final body = await response.json() as Map<String, dynamic>;
      expect(body['success'], isFalse);
      expect(body['message'], contains('Not Found'));
      expect(body['data'], equals({'reason': 'missing'}));
    });
  });

  group('DLog Tests', () {
    test('DLog prints message successfully under different levels', () {
      expect(() => DLog('Test verbose log', level: DLevel.verbose), returnsNormally);
      expect(() => DLog('Test debug log', level: DLevel.debug), returnsNormally);
      expect(() => DLog('Test info log', level: DLevel.info), returnsNormally);
      expect(() => DLog('Test warning log', level: DLevel.warning), returnsNormally);
      expect(() => DLog('Test error log', level: DLevel.error), returnsNormally);
      expect(() => DLog('Test wtf log', level: DLevel.wtf), returnsNormally);
      expect(() => DLog('Test nothing log', level: DLevel.nothing), returnsNormally);
    });
  });
}
