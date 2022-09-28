import 'dart:convert';

class Questions {
  Questions({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.correct,
  });

  String question;
  String a;
  String b;
  String c;
  String d;
  String correct;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        question: json["Question"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        correct: json["correct"],
      );
}

List<Questions> questionsFromJson(String str) =>
    List<Questions>.from(json.decode(str).map((x) => Questions.fromJson(x)));
