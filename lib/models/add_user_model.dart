import 'dart:convert';

class AddUserModel {
  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  AddUserModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  factory AddUserModel.fromRawJson(String str) =>
      AddUserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}
