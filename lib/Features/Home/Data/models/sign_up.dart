class SignUpModel {
  String? message;

  SignUpModel({this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
