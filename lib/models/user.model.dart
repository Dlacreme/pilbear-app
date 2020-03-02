// ignore_for_file: non_constant_identifier_names

import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/models/category.model.dart';

class UserModel {
  int id;
  int profile_id;
  String email;
  String nickname;
  String first_name;
  String last_name;
  String picture_url;
  DateTime birthdate;
  String gender;
  List<CategoryModel> favorites;

  String get name {
    return isNullEmptyOrFalse(this.nickname) ? 'John Doe' : this.nickname;
    // if (isNullEmptyOrFalse(first_name) && isNullEmptyOrFalse(last_name)) {
    //   return 'John Doe';
    // }
    // return "$first_name $last_name";
  }

  UserModel(dynamic data) {
    this.id = data["id"];
    this.profile_id = data["profile_id"];
    this.email = data["email"];
    this.nickname = data["nickname"];
    this.first_name = data["first_name"];
    this.last_name = data["last_name"];
    this.picture_url = data["picture_url"];
    this.birthdate =
        data["birthdate"] != null ? DateTime.parse(data["birthdate"]) : null;
    this.gender = data["gender"];
    this.favorites = [];
    (data["favorites"] as List<dynamic>).forEach((e) {
      this.favorites.add(CategoryModel(e));
    });
  }
}
