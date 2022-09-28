import 'dart:convert';

User userFromJson(String str) => User.fromJsonLogin(json.decode(str));

String userToJsonLogin(User data) => json.encode(data.toJsonLogin());
String userToJsonName(User data) => json.encode(data.toJsonName());

class User {
  User({
    required this.mobile,
    this.name,
    required this.token,
  });

  String mobile;
  String? name;
  String token;
  factory User.fromJsonLogin(Map<String, dynamic> json) => User(
        mobile: json["mobile"],
        token: json["token"],
      );

  Map<String, dynamic> toJsonLogin() => {
        "mobile": mobile,
      };
  Map<String, dynamic> toJsonName() => {
        "name": name,
      };
}
