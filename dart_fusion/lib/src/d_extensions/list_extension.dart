part of '../../dart_fusion.dart';

/// Extensioning generic [List] value.
extension ListExtension<OldValue extends Object?> on List<OldValue> {
  /// Generate index and item of a [List].
  ///
  /// ```dart
  /// List<String> texts = ["one", "two", "three"];
  /// List<Widget> widgets = texts.to((index, item) => Text("$index: $item"));
  /// ```
  List<NewValue> to<NewValue extends Object?>(
          NewValue Function(int index, OldValue item) value) =>
      asMap()
          .entries
          .map<NewValue>((map) => value(map.key, map.value))
          .toList();

  /// A shortcut of extended sublist with safety.
  List<OldValue> limit(int start, int length) {
    final safeStart = start.clamp(0, this.length);
    final safeLength = length < 0 ? 0 : length;
    final safeEnd = (safeStart + safeLength).clamp(safeStart, this.length);
    return sublist(safeStart, safeEnd);
  }

  /// A shortcut to get random item inside list.
  OldValue get random => this[Random().nextInt(length)];
}

/// An extension of [DModel] list.
extension DModelListExtension on List<DModel> {
  /// A shortcut to call [toJSON] from [DModel].
  ///
  /// ```dart
  /// List<DModel> dmodels = [DModel(), DModel()];
  /// List<JSON> jsons = dmodels.toJSON;
  /// ```
  List<JSON> get toJSON => map((e) => e.toJSON).toList();
}
