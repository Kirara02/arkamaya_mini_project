import 'dart:convert';

class FormAddModel {
  String? name;
  String? job;

  FormAddModel({
    this.name,
    this.job,
  });

  factory FormAddModel.fromRawJson(String str) =>
      FormAddModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormAddModel.fromJson(Map<String, dynamic> json) => FormAddModel(
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
