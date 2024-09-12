import 'package:bookly/core/Api/end_points.dart';

class SignInModel {
  String? message;
  String? token;

  SignInModel({this.message, this.token});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json[ApiKey.message] as String?,
        token: json[ApiKey.token] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.message: message,
        ApiKey.token: token,
      };
}
