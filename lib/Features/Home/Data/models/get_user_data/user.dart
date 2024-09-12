import 'location.dart';

class User {
  Location? location;
  String? id;
  String? name;
  String? phone;
  String? email;
  String? profilePic;
  List<dynamic>? favorites;
  DateTime? createdAt;

  User({
    this.location,
    this.id,
    this.name,
    this.phone,
    this.email,
    this.profilePic,
    this.favorites,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        profilePic: json['profilePic'] as String?,
        favorites: json['favorites'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        '_id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'profilePic': profilePic,
        'favorites': favorites,
        'createdAt': createdAt?.toIso8601String(),
      };
}
