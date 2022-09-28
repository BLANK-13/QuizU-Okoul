import 'dart:convert';

import 'package:quiz_u/constants.dart';
import 'package:quiz_u/models/questions.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class QuestionsResponse {
  Future<List<Questions>> getQuestions(String token) async {
    var client = http.Client();
    var url = getUri('https://quizu.okoul.com/Questions');

    var response = await client.get(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    if (response.statusCode == 200) {
      var json = response.body;
      print(jsonDecode(json).runtimeType);
      return questionsFromJson(json);
    } else {
      return [];
    }
  }
}
