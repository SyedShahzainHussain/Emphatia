class UserModel {
  bool? success;
  String? message;
  User? user;

  UserModel({this.success, this.message, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? sId;
  String? email;
  String? token;
  String? gender;
  String? age;

  User({this.sId, this.email, this.token, this.gender, this.age});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    token = json['token'];
    gender = json['gender'];
    age = json['age'];
  }
}
