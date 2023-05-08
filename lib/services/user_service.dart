import 'dart:convert';

import 'package:flutter_mini_project/models/add_user_model.dart';
import 'package:flutter_mini_project/models/form_add_model.dart';
import 'package:flutter_mini_project/models/user_detail_model.dart';
import 'package:flutter_mini_project/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getUsers() async {
    try {
      final res = await http.get(
        Uri.parse('https://reqres.in/api/users'),
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        ).toList();
      }

      throw jsonDecode(res.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDetailModel> getUserById(int id) async {
    try {
      final res = await http.get(
        Uri.parse('https://reqres.in/api/users/$id'),
      );

      if (res.statusCode == 200) {
        UserDetailModel user = UserDetailModel.fromJson(
          jsonDecode(res.body)['data'],
        );

        return user;
      }

      throw jsonDecode(res.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddUserModel> addUser(FormAddModel data) async {
    try {
      final res = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        body: data.toJson(),
      );

      if (res.statusCode == 201) {
        AddUserModel user = AddUserModel.fromJson(jsonDecode(res.body));
        return user;
      }

      throw jsonDecode(res.body);
    } catch (e) {
      rethrow;
    }
  }
}
