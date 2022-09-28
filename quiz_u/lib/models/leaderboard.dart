// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

List<LeaderBoard> leaderBoardFromJson(String str) => List<LeaderBoard>.from(
    json.decode(str).map((x) => LeaderBoard.fromJson(x)));

class LeaderBoard {
  LeaderBoard({
    required this.name,
    required this.score,
  });

  String name;
  int score;

  factory LeaderBoard.fromJson(Map<dynamic, dynamic> json) => LeaderBoard(
        name: json["name"] ?? null,
        score: json["score"] ?? null,
      );
}
