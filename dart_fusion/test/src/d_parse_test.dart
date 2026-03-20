import 'package:test/test.dart';
import 'package:dart_fusion/dart_fusion.dart';

class Custom {
  final int id;
  const Custom(this.id);
  factory Custom.fromJson(dynamic v) => Custom(DParse.to<int>(v));
  @override
  bool operator ==(Object other) => other is Custom && id == other.id;
  @override
  int get hashCode => id.hashCode;
}

void main() {
  group('DParse Utility Tests', () {
    test('httpMethodMessage', () {
      expect(DParse.httpMethodMessage('GET'), contains('successfully loaded'));
      expect(
          DParse.httpMethodMessage('POST'), contains('successfully created'));
      expect(
          DParse.httpMethodMessage('INVALID'), contains('Method unidentified'));
    });

    test('httpStatusMessage', () {
      expect(DParse.httpStatusMessage(200), contains('OK'));
      expect(DParse.httpStatusMessage(404), contains('Not Found'));
      expect(DParse.httpStatusMessage(500), contains('Internal Server Error'));
      expect(DParse.httpStatusMessage(999), contains('Unknown Status Code'));
    });

    test('exceptionMessage', () {
      expect(
          DParse.exceptionMessage(
              'FormatException: Unexpected end of input (at character 1)\n\n^\n'),
          equals('Data does not exist'));
      expect(
          DParse.exceptionMessage('Null check operator used on a null value'),
          equals('Data does not exist'));
      expect(DParse.exceptionMessage('Generic error'), equals('Generic error'));
    });
  });

  group('DParse.to<T> & JSONExtension.of Parsing Tests', () {
    final Map<String, dynamic> data = {
      'int': 42,
      'double': 3.14,
      'num': 100.5,
      'bool': true,
      'string': 'hello',
      'date': DateTime.utc(2024, 1, 1),
      'json': {'number': 1, 'name': 'string'},
      'jsonStr': '{"number": 1, "name": "string"}',
      'intStr': '42',
      'doubleStr': '3.14',
      'boolStr': 'true',
      'dateStr': '2024-01-01T00:00:00Z',
      'listInt': [1, 2, 3],
      'listDouble': [1.1, 2.2],
      'listNum': [1, 2.2, 100],
      'listBool': [true, false],
      'listString': ['a', 'b'],
      'listDate': [DateTime.utc(2024, 1, 1)],
      'mapInt': {'a': 1, 'b': 2},
      'mapDouble': {'a': 1.1, 'b': 2.2},
      'mapNum': {'a': 1, 'b': 2.2},
      'mapBool': {'a': true, 'b': false},
      'mapString': {'a': 'x', 'b': 'y'},
      'mapDate': {'a': DateTime.utc(2024, 1, 1)},
      'nullableNull': null,
      'invalidInt': 'abc',
      'invalidDouble': 'xyz',
      'invalidBool': 'not-bool',
      'invalidDate': 'not-date',
      'invalidList': 'not-list',
      'invalidMap': 'not-map',
      'invalidJson': 'not-json',
    };

    group('Primitive Types (Non-nullable)', () {
      test('int', () {
        expect(data.of<int>('int'), 42);
        expect(data.of<int>('intStr'), 42);
        expect(data.of<int>('invalidInt'), 0);
        expect(data.of<int>('invalidInt', 99), 99);
      });
      test('double', () {
        expect(data.of<double>('double'), 3.14);
        expect(data.of<double>('doubleStr'), 3.14);
        expect(data.of<double>('invalidDouble'), 0.0);
        expect(data.of<double>('invalidDouble', 9.9), 9.9);
      });
      test('num', () {
        expect(data.of<num>('num'), 100.5);
        expect(data.of<num>('int'), 42);
        expect(data.of<num>('invalidInt'),
            0.0); // num defaults to 0.0 via mayToDouble
      });
      test('bool', () {
        expect(data.of<bool>('bool'), true);
        expect(data.of<bool>('boolStr'), true);
        expect(data.of<bool>('invalidBool'), false);
        expect(data.of<bool>('invalidBool', true), true);
      });
      test('String', () {
        expect(data.of<String>('string'), 'hello');
        expect(data.of<String>('int'), '42');
        expect(data.of<String>('missing'), '');
        expect(data.of<String>('missing', 'fallback'), 'fallback');
      });
      test('DateTime', () {
        expect(data.of<DateTime>('date'), DateTime.utc(2024, 1, 1));
        expect(data.of<DateTime>('dateStr'), DateTime.utc(2024, 1, 1));
        expect(data.of<DateTime>('invalidDate'),
            isA<DateTime>()); // Defaults to now
      });

      test('JSON', () {
        expect(data.of<JSON>('json'), equals({'number': 1, 'name': 'string'}));
        expect(data.of<JSON>('jsonStr'),
            equals({'number': 1, 'name': 'string'}));
        expect(data.of<JSON>('missing'),
            equals({})); // non-existent key returns default empty map
        expect(data.of<JSON>('invalidJson'),
            isA<JSON>()); // invalid json returns default empty map
      });
    });

    group('Primitive Types (Nullable)', () {
      test('int?', () {
        expect(data.of<int?>('int'), 42);
        expect(data.of<int?>('nullableNull'), isNull);
        expect(data.of<int?>('invalidInt'), isNull);
        expect(data.of<int?>('nullableNull', 42), 42);
      });
      test('double?', () => expect(data.of<double?>('nullableNull'), isNull));
      test('num?', () => expect(data.of<num?>('nullableNull'), isNull));
      test('bool?', () => expect(data.of<bool?>('nullableNull'), isNull));
      test('String?', () {
        expect(data.of<String?>('string'), 'hello');
        expect(data.of<String?>('nullableNull'), isNull);
        expect(data.of<String?>('nullableNull', 'guest'), 'guest');
      });
      test('DateTime?',
          () => expect(data.of<DateTime?>('nullableNull'), isNull));
    });

    group('Lists (Non-nullable)', () {
      test('List<int>', () {
        expect(data.of<List<int>>('listInt'), [1, 2, 3]);
        expect(data.of<List<int>>('invalidList'), <int>[]);
        expect(data.of<List<int>>('invalidList', [0]), [0]);
      });
      test('List<double>',
          () => expect(data.of<List<double>>('listDouble'), [1.1, 2.2]));
      test('List<num>',
          () => expect(data.of<List<num>>('listNum'), [1, 2.2, 100]));
      test('List<bool>',
          () => expect(data.of<List<bool>>('listBool'), [true, false]));
      test('List<String>',
          () => expect(data.of<List<String>>('listString'), ['a', 'b']));
      test(
          'List<DateTime>',
          () => expect(
              data.of<List<DateTime>>('listDate'), [DateTime.utc(2024, 1, 1)]));
    });

    group('Lists (Nullable)', () {
      test('List<int>?', () {
        expect(data.of<List<int>?>('listInt'), [1, 2, 3]);
        expect(data.of<List<int>?>('nullableNull'), isNull);
        expect(data.of<List<int>?>('nullableNull', [42]), [42]);
      });
      test('List<String>?',
          () => expect(data.of<List<String>?>('nullableNull'), isNull));
    });

    group('Maps (Non-nullable)', () {
      test('Map<String, int>', () {
        expect(data.of<Map<String, int>>('mapInt'), {'a': 1, 'b': 2});
        expect(data.of<Map<String, int>>('invalidMap'), <String, int>{});
        expect(data.of<Map<String, int>>('invalidMap', {'err': 0}), {'err': 0});
      });
      test(
          'Map<String, double>',
          () => expect(
              data.of<Map<String, double>>('mapDouble'), {'a': 1.1, 'b': 2.2}));
      test(
          'Map<String, bool>',
          () => expect(
              data.of<Map<String, bool>>('mapBool'), {'a': true, 'b': false}));
      test(
          'Map<String, String>',
          () => expect(
              data.of<Map<String, String>>('mapString'), {'a': 'x', 'b': 'y'}));
    });

    group('Maps (Nullable)', () {
      test('Map<String, int>?', () {
        expect(data.of<Map<String, int>?>('mapInt'), {'a': 1, 'b': 2});
        expect(data.of<Map<String, int>?>('nullableNull'), isNull);
        expect(data.of<Map<String, int>?>('nullableNull', {'x': 1}), {'x': 1});
      });
    });

    group('Special & Nested Cases', () {
      test('dynamic', () => expect(data.of<dynamic>('int'), 42));
      test('Object', () => expect(data.of<Object>('string'), 'hello'));
      test('JSON', () => expect(data.of<JSON>('mapInt'), {'a': 1, 'b': 2}));
      test('List<List<int>>', () {
        final matrix = {
          'm': [
            [1],
            [2, 3]
          ]
        };
        expect(matrix.of<List<List<int>>>('m'), [
          [1],
          [2, 3]
        ]);
      });
      test('List<JSON>', () {
        final list = {
          'items': [
            {'id': 1},
            {'id': 2}
          ]
        };
        expect(list.of<List<JSON>>('items'), [
          {'id': 1},
          {'id': 2}
        ]);
      });
    });

    group('Custom Registry', () {
      test('Register and parse CustomClass automatically', () {
        DParse.register<Custom>((v) => Custom.fromJson(v));
        final json = {
          'id': 100,
          'list': [100, 200]
        };
        expect(json.of<Custom>('id'), equals(Custom(100)));
        expect(
            json.of<List<Custom>>('list'), equals([Custom(100), Custom(200)]));
      });
    });
  });
}
