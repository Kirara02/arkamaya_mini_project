import 'dart:convert';

class UserDetailModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetailModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDetailModel.fromRawJson(String str) =>
      UserDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
