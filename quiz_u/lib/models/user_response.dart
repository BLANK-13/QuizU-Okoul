import 'package:quiz_u/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserResponse {
  Future<dynamic> postLogin(String mobile, {String otp = '0000'}) async {
    final Map<String, String> bodyParams = {
      "OTP": otp,
      "mobile": mobile,
    };

    var client = http.Client();
    var url = getUri('https://quizu.okoul.com/Login');
    var response = await client.post(url, body: bodyParams);
    if (response.statusCode == 201) {
      var json = response.body;
      print(json);
      var userInfo = jsonDecode(json);
      print(userInfo);
      return userInfo;
    } else {
      return false;
    }
  }
}
