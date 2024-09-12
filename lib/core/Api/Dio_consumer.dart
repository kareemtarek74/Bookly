import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/Api/Api_interceptor.dart';
import 'package:bookly/core/Api/end_points.dart';
import 'package:bookly/core/error/error_model/error_model..dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioException(e);
    }
  }
}

void handleDioException(DioError e) {
  switch (e.type) {
    case DioErrorType.connectTimeout:
      throw serverException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioErrorType.sendTimeout:
      throw serverException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioErrorType.receiveTimeout:
      throw serverException(errModel: ErrorModel.fromJson(e.response!.data));

    case DioErrorType.cancel:
      throw serverException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioErrorType.other:
      throw serverException(errModel: ErrorModel.fromJson(e.response?.data));
    case DioErrorType.response:
      switch (e.response!.statusCode) {
        case 400:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 401:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 403:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 404:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 409:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 422:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 500:
          throw serverException(
              errModel: ErrorModel.fromJson(e.response!.data));
      }
      break;
  }
}
