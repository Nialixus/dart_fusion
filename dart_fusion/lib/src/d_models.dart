part of '../dart_fusion.dart';

/// Base dart model which consist `copyWith`, `toJSON`, `fromJSON` and `toString` value;
///
/// ```dart
/// class NewDModel extends DModel {}
/// ```
class DModel extends Equatable {
  /// Default constructor
  const DModel();

  /// Copy variables in this DModel and make a new one out of it.
  ///
  /// ```dart
  /// DModel DModel = const DModel();
  /// DModel newDModel = DModel.copyWith();
  /// ```
  DModel copyWith() => const DModel();

  /// Convert this DModel to JSON.
  ///
  /// ```dart
  /// DModel DModel = const DModel();
  /// JSON json = DModel.toJSON;
  /// ```
  JSON get toJSON => {'model_type': runtimeType.toString()};

  /// Convert a JSON to this DModel.
  ///
  /// ```dart
  /// DModel model = DModel.fromJSON(json);
  /// ```
  static DModel fromJSON(JSON value) => const DModel();

  /// A Dummy test model value.
  ///
  /// ```dart
  /// DModel test = Dmodel.test;
  /// ```
  static DModel get test {
    return const DModel();
  }

  @override
  List<Object?> get props =>
      toJSON.entries.map((e) => '${e.key}: ${e.value}').toList();

  @override
  String toString() =>
      toJSON.entries.map((e) => '${e.key}: ${e.value}').toString();
}

/// Basic model in root of every `Response`, containing [success] status,
/// [message] and also [data] that extends [DModel] class.
///
/// ```dart
/// ResponseModel(
///   success: true,
///   message: 'Successfully Fetching Data!',
///   data: const ResponseDataModel());
/// ```
class ResponseModel extends DModel {
  /// Default constructor of [ResponseModel] with value [success] is `false`,
  /// [message] is `No Message`, and [data] is [DModel].
  const ResponseModel({
    this.success = false,
    this.message = 'No Message',
    this.data,
  });

  static ResponseModel fromJSON<T extends DModel>(JSON value) {
    return ResponseModel(
        success: value.of('success'),
        message: value.of('message'),
        data: value.of('data'));
  }

  /// Success status of whether the response is what is expected or not.
  final bool success;

  /// A short description of Response [success] status.
  final String message;

  /// Child data of [ResponseModel], must be a class that extends
  /// [DModel].
  final JSON? data;

  @override
  ResponseModel copyWith({
    bool? success,
    String? message,
    JSON? data,
  }) {
    return ResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  JSON get toJSON => {
        'success': success,
        'message': message,
        'data': data?.toJSON,
        ...super.toJSON,
      };
}
