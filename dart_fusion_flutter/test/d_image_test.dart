import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dart_fusion_flutter/dart_fusion_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DImage Widget Tests', () {
    testWidgets('renders Image from ImageProvider source', (WidgetTester tester) async {
      // 1x1 transparent PNG
      final pngBytes = Uint8List.fromList([
        137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82,
        0, 0, 0, 1, 0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137,
        0, 0, 0, 10, 73, 68, 65, 84, 120, 156, 99, 0, 1, 0, 0, 5,
        0, 1, 13, 10, 45, 180, 0, 0, 0, 0, 73, 69, 78, 68, 174, 66,
        96, 130
      ]);
      final provider = MemoryImage(pngBytes);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DImage(source: provider),
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);

      final Image imageWidget = tester.widget(imageFinder);
      expect(imageWidget.image, equals(provider));
    });

    testWidgets('renders PDF fallback card for .pdf files', (WidgetTester tester) async {
      const pdfPath = 'documents/invoice.pdf';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DImage(source: pdfPath),
          ),
        ),
      );

      // Verify container with PDF card is rendered
      expect(find.byType(Container), findsOneWidget);
      expect(find.byIcon(Icons.picture_as_pdf), findsOneWidget);
      expect(find.text('invoice.pdf'), findsOneWidget);
    });

    testWidgets('renders SvgPicture from SVG bytes source', (WidgetTester tester) async {
      // Minimal valid SVG string
      const svgString = '<svg height="100" width="100"><circle cx="50" cy="50" r="40" /></svg>';
      final svgBytes = Uint8List.fromList(utf8.encode(svgString));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DImage(source: svgBytes),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('renders SvgPicture from data URI svg source', (WidgetTester tester) async {
      const svgString = '<svg height="100" width="100"><circle cx="50" cy="50" r="40" /></svg>';
      final base64Svg = base64Encode(utf8.encode(svgString));
      final dataUri = 'data:image/svg+xml;base64,$base64Svg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DImage(source: dataUri),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('renders SvgPicture from File object (SVG)', (WidgetTester tester) async {
      final file = File('/tmp/dummy_image.svg');
      file.writeAsStringSync('<svg height="100" width="100"><circle cx="50" cy="50" r="40" /></svg>');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DImage(source: file),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);

      try {
        file.deleteSync();
      } catch (_) {}
    });

    testWidgets('renders Image.file from absolute file path string', (WidgetTester tester) async {
      const absolutePath = '/tmp/dummy_image.png';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DImage(source: absolutePath),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      final Image imageWidget = tester.widget(find.byType(Image));
      expect(imageWidget.image, isA<FileImage>());
      expect((imageWidget.image as FileImage).file.path, absolutePath);
    });
  });
}
