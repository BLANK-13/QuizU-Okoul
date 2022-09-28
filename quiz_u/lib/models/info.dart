import 'dart:convert';
import 'dart:io';
import 'package:quiz_u/constants.dart';
import 'package:http/http.dart' as http;

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

class Info {
  Info({
    required this.mobile,
    required this.name,
  });

  String mobile;
  String name;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        mobile: json["mobile"],
        name: json["name"] ?? '',
      );
}

class InfoResponse {
  Future<Info?> getInfo(String token) async {
    var client = http.Client();

    var url = getUri('https://quizu.okoul.com/UserInfo');
    var response = await client.get(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    if (response.statusCode == 200) {
      return infoFromJson(response.body);
    } else {
      return Info(mobile: '', name: '');
    }
  }
}
