import 'package:dio/dio.dart';
import 'package:domain/common/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

typedef ResponseToModelMapper<Data, Model> = Model? Function(Data? data);
typedef EntityToModelMapper<Entity, Model> = Model? Function(Entity? entity);
typedef SaveResult<Data> = Future Function(Data? data);

// Nơi bọc wrap repository. Sử dụng (isolate) để parse json sang model để tăng tốc performance
abstract class BaseRepository {
  final _logger = Logger();

  Future<Result<Model>> localCall<Entity, Model>(Future<Entity?> call,
      {required EntityToModelMapper<Entity, Model> mapper}) async {
    try {
      final response = await call;
      if (response == null) {
        _logger.d("DB response is null");
        return ValueError(ErrorType.unknow, "DB response is null!");
      }
      _logger.d("DB success message -> $response");
      return ValueSuccess(mapper.call(response));
    } catch (exception) {
      _logger.d("DB failure message -> $exception");
      return ValueError(ErrorType.unknow, "Unknown DB error");
    }
  }
}
