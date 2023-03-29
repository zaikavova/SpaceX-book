import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:space_x_book/assembly/json_serializable_converter/resource_error.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  const JsonSerializableConverter(this.factories);

  T? _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) => values
      .where((dynamic v) => v != null)
      .map<T>((dynamic v) => _decode<T>(v) as T)
      .toList();

  dynamic _decode<T>(dynamic entity) {
    if (entity is Iterable) return _decodeList<T>(entity as List);

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    // use [JsonConverter] to decode json
    final jsonRes = await super.convertResponse<dynamic, dynamic>(response);

    return jsonRes.copyWith<ResultType>(
      body: _decode<Item>(jsonRes.body) as ResultType,
    );
  }

  @override
  // all objects should implements toJson method
  // ignore: unnecessary_overrides
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response response) async {
    // use [JsonConverter] to decode json
    final jsonRes = await super.convertError<dynamic, dynamic>(response);

    return jsonRes.copyWith<ResourceError>(
      body: ResourceError.fromJsonFactory(jsonRes.body as Map<String, dynamic>),
    );
  }
}
