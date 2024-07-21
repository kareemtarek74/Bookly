class Error {
  int? code;
  String? message;
  List<Error>? errors;

  Error({this.code, this.message, this.errors});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'] as int?,
        message: json['message'] as String?,
        errors: (json['errors'] as List<dynamic>?)
            ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'errors': errors?.map((e) => e.toJson()).toList(),
      };
}
