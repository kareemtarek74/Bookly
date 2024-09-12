import 'user.dart';

class GetUserData {
  User? user;

  GetUserData({this.user});

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };
}
