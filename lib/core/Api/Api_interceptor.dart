import 'package:bookly/core/Api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] = 'AIzaSyC8k7k2UfSb9eU0Eg3wRr2cF7Xyf6hY0u0';
    super.onRequest(options, handler);
  }
}
