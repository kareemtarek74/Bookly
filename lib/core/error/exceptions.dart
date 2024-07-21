import 'package:bookly/core/error/error_model/error_model..dart';

class serverException implements Exception {
  final ErrorModel errModel;

  serverException({required this.errModel});
}
