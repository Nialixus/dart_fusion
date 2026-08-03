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
  group('JSONExtension Tests', () {
    test('merge merges two JSON maps', () {
      final json1 = {
        'a': 1,
        'b': {'x': 10}
      };
      final json2 = {
        'b': {'y': 20},
        'c': 3
      };
      final merged = json1.merge(json2);
      expect(merged, {
        'a': 1,
        'b': {'x': 10, 'y': 20},
        'c': 3,
      });
    });

    test('toJSON constructs nested maps in memory correctly', () {
      final input = {
        'user.name': 'John Doe',
        'user.age': 30,
        'user.address.city': 'New York',
        'user.address.zip': '10001',
        'tags': ['admin', 'user'],
        'description': 'A user with a "profile"',
      };

      final output = input.toJSON;
      expect(output, {
        'user': {
          'name': 'John Doe',
          'age': 30,
          'address': {
            'city': 'New York',
            'zip': '10001',
          }
        },
        'tags': ['admin', 'user'],
        'description': 'A user with a "profile"',
      });
    });
  });

  group('ListExtension Tests', () {
    test('limit returns sliced sublist safely', () {
      final list = [1, 2, 3, 4, 5];
      expect(list.limit(1, 2), [2, 3]);
      expect(list.limit(3, 10), [4, 5]);
      expect(list.limit(-2, 3), [1, 2, 3]); // should clamp negative start to 0
      expect(list.limit(2, -1), <int>[]); // should clamp negative length to 0
      expect(list.limit(10, 2), <int>[]); // out of bounds start
    });

    test('random returns a random element', () {
      final list = [42];
      expect(list.random, 42);
    });
  });

  group('NumberExtension Tests', () {
    test('min and max limits', () {
      expect(5.min(10), 10);
      expect(15.min(10), 15);
      expect(100.max(10), 10);
      expect(5.max(10), 5);
      expect(50.limit(0, 100), 50);
      expect((-5).limit(0, 100), 0);
      expect(150.limit(0, 100), 100);
    });

    test('toReadableBytes converts sizes correctly', () {
      expect(500.toReadableBytes, '500 B');
      expect((1024 * 1.5).toInt().toReadableBytes, '1.50 KB');
      expect((1024 * 1024 * 2.75).toInt().toReadableBytes, '2.75 MB');
      expect((1024 * 1024 * 1024 * 3.25).toInt().toReadableBytes, '3.25 GB');
      expect((1024.0 * 1024 * 1024 * 1024 * 4.5).toInt().toReadableBytes,
          '4.50 TB');
    });

    test('toDuration converts numeric values to Durations', () {
      expect(
          5.toDuration(type: DurationType.seconds), const Duration(seconds: 5));
      expect(2.toDuration(type: DurationType.days), const Duration(days: 2));
    });
  });

  group('StringExtension Tests', () {
    test('toDouble uses onError on fail', () {
      expect('3.14'.toDouble(), 3.14);
      expect('invalid'.toDouble(5.5), 5.5);
      expect('invalid'.toDouble(), 0.0);
    });

    test('toDuration uses onError on fail', () {
      expect('5'.toDuration(), const Duration(seconds: 5));
      expect('invalid'.toDuration(onError: const Duration(minutes: 1)),
          const Duration(minutes: 1));
      expect('invalid'.toDuration(), Duration.zero);
    });

    test('tryToDuration converts string to duration or null', () {
      expect('10'.tryToDuration(), const Duration(seconds: 10));
      expect('invalid'.tryToDuration(), isNull);
    });
  });

  group('RequestContextExtension & Header Tests', () {
    test('isWebSocket returns true for websocket upgrades', () {
      final req1 = Request('GET', Uri.parse('http://localhost/ws'), headers: {
        'Upgrade': 'websocket',
      });
      final context1 = TestRequestContext(req1);
      expect(context1.isWebSocket, isTrue);

      final req2 = Request('GET', Uri.parse('http://localhost/ws_normal'));
      final context2 = TestRequestContext(req2);
      expect(context2.isWebSocket, isFalse);
    });

    test('Header.fromJSON is case-insensitive and hyphen-agnostic', () {
      final h1 = Header.fromJSON({'model_type': 'content-type'});
      expect(h1, isA<ContentType>());

      final h2 = Header.fromJSON({'model_type': 'AUTHORIZATION'});
      expect(h2, isA<Authorization>());

      final h3 = Header.fromJSON({'model_type': 'accept-language'});
      expect(h3, isA<AcceptLanguage>());
    });
  });
}
