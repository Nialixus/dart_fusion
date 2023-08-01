part of '../appstate_widget.dart';

/// Root model that will be used in this entire system.
///
/// ```dart
/// class NewModel extends Model {}
/// ```
class AppModel extends Equatable {
  /// Default constructor
  const AppModel({this.modelType = 'Model'});

  /// Convert a JSON to this model.
  ///
  /// ```dart
  /// Model model = Model.fromJSON(json);
  /// ```
  // ignore: avoid_unused_constructor_parameters
  const AppModel.fromJSON(JSON value) : this();

  /// Copy variables in this model and make a new one out of it.
  ///
  /// ```dart
  /// Model model = const Model();
  /// Model newModel = model.copyWith();
  /// ```
  AppModel copyWith() => const AppModel();

  /// Convert this model to JSON.
  ///
  /// ```dart
  /// Model model = const Model();
  /// JSON json = model.toJSON;
  /// ```
  JSON get toJSON => {'model_type': modelType};

  /// Required as an indicator type to be parsed from JSON.
  ///
  /// ```dart
  /// Model model = const Model();
  /// print(model.toJSON); // {"model_type": "Model"}
  /// ```
  final String modelType;

  @override
  List<Object?> get props =>
      toJSON.entries.map((e) => '${e.key}: ${e.value}').toList();
}
