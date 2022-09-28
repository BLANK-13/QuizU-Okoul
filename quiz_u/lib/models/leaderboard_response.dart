import 'package:quiz_u/models/leaderboard.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quiz_u/constants.dart';

class LeaderBoardResponse {
  Future<List<LeaderBoard>> getPlaces(String token) async {
    var client = http.Client();
    var url = getUri('https://quizu.okoul.com/TopScores');

    var response = await client.get(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    if (response.statusCode == 200) {
      var json = response.body;
      return leaderBoardFromJson(json);
    } else {
      return [];
    }
  }
}
