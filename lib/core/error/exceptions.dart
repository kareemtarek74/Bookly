import 'package:bookly/core/error/Auth_error_model.dart';
import 'package:bookly/core/error/error_model/error_model..dart';

class ServerException implements Exception {
  final ErrorModel errModel;
  final AuthErrorModel authErrorModel;

  ServerException({required this.errModel, required this.authErrorModel});
}
