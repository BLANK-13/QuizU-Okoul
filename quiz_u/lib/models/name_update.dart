import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quiz_u/constants.dart';

class NameUpdate {
  Future<dynamic> nameUpdate(String name, String token) async {
    final Map<String, String> bodyParams = {
      "name": name,
    };

    var client = http.Client();
    var url = getUri('https://quizu.okoul.com/Name');
    var response = await client.post(url,
        body: bodyParams,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
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
