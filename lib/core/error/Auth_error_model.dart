import 'package:bookly/core/Api/end_points.dart';

class AuthErrorModel {
  final int status;
  final String errorMessage;
  AuthErrorModel({required this.status, required this.errorMessage});
  factory AuthErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthErrorModel(
        status: jsonData[ApiKey.status],
        errorMessage: jsonData[ApiKey.errorMessage]);
  }
}
