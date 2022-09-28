import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/models/questions.dart';
import 'package:quiz_u/models/questions_response.dart';
import 'package:quiz_u/screens/win_screen.dart';
import 'package:quiz_u/screens/wrong_answer_screen.dart';
import 'package:quiz_u/widgets/custom_button.dart';
import 'package:quiz_u/widgets/timer.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Questions>? questions;
  bool isAlive = true, isLoaded = false, skipBtn = true;
  int index = 0;

  @override
  void initState() {
    super.initState();
    getQuestion();
  }

  push() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WinScreen(token: widget.token, score: (index + 1).toString())));
  }

  getQuestion() async {
    questions = await QuestionsResponse().getQuestions(widget.token);

    if (questions != null) {
      Future.delayed(const Duration(minutes: 2, seconds: 0), () => 0)
          .then((_) => push());
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: !isLoaded
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// to make sure to only rebuild the timer no need to rebuild the whole screen every second too.
                  const TimerWidget(),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      SizedBox(
                        width: 340,
                        child: Text(
                          questions![index].question,
                          style: TextStyle(
                              fontSize: questions![index].question.length <= 32
                                  ? 25
                                  : 28,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'JannaLT',
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        leading: SizedBox(
                          height: 75,
                          width: 170,
                          child: ElevatedButton(
                            // A button
                            onPressed: () {
                              if (questions![index].correct == 'a' &&
                                  index < questions!.length - 1) {
                                setState(() {
                                  index++;
                                });
                              } else if (questions![index].correct == 'a' &&
                                  index == questions!.length - 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WinScreen(
                                            token: widget.token,
                                            score: (index + 1).toString())));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WrongAnswerScreen(
                                              token: widget.token,
                                            )));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey[350]),
                            ),
                            child: Text(
                              questions![index].a,
                              style: TextStyle(
                                color: mainColor,
                                fontSize:
                                    questions![index].a.length > 12 ? 16 : 20,
                                fontFamily: 'JannaLT',
                              ),
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          height: 75,
                          width: 170,
                          child: ElevatedButton(
                            // B button
                            onPressed: () {
                              if (questions![index].correct == 'b' &&
                                  index < questions!.length - 1) {
                                setState(() {
                                  index++;
                                });
                              } else if (questions![index].correct == 'b' &&
                                  index == questions!.length - 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WinScreen(
                                            token: widget.token,
                                            score: (index + 1).toString())));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WrongAnswerScreen(
                                              token: widget.token,
                                            )));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey[350]),
                            ),
                            child: Text(
                              questions![index].b,
                              style: TextStyle(
                                color: mainColor,
                                fontSize:
                                    questions![index].b.length > 12 ? 16 : 20,
                                fontFamily: 'JannaLT',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        leading: SizedBox(
                          height: 75,
                          width: 170,
                          child: ElevatedButton(
                            // C button
                            onPressed: () {
                              if (questions![index].correct == 'c' &&
                                  index < questions!.length - 1) {
                                setState(() {
                                  index++;
                                });
                              } else if (questions![index].correct == 'c' &&
                                  index == questions!.length - 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WinScreen(
                                            token: widget.token,
                                            score: (index + 1).toString())));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WrongAnswerScreen(
                                              token: widget.token,
                                            )));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey[350]),
                            ),
                            child: Text(
                              questions![index].c,
                              style: TextStyle(
                                color: mainColor,
                                fontSize:
                                    questions![index].c.length > 12 ? 16 : 20,
                                fontFamily: 'JannaLT',
                              ),
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          height: 75,
                          width: 170,
                          child: ElevatedButton(
                            // D button
                            onPressed: () {
                              if (questions![index].correct == 'd' &&
                                  index < questions!.length - 1) {
                                setState(() {
                                  index++;
                                });
                              } else if (questions![index].correct == 'd' &&
                                  index == questions!.length - 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WinScreen(
                                            token: widget.token,
                                            score: (index + 1).toString())));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WrongAnswerScreen(
                                              token: widget.token,
                                            )));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey[350]),
                            ),
                            child: Text(
                              questions![index].d,
                              style: TextStyle(
                                color: mainColor,
                                fontSize:
                                    questions![index].d.length > 12 ? 16 : 20,
                                fontFamily: 'JannaLT',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      skipButton()
                    ],
                  )
                ],
              ));
  }

  Widget skipButton() {
    return skipBtn
        ? MyElevatedButton(
            onPressed: () => mounted // to avoid unmounted error.
                ? setState(() {
                    skipBtn = false;
                    if (index < questions!.length - 1) {
                      index++;
                    } else if (index == questions!.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WinScreen(
                                  token: widget.token,
                                  score: (index + 1).toString())));
                    }
                  })
                : {},
            child: skip,
            width: 170,
            height: 60,
            borderRadius: BorderRadius.circular(20),
          )
        : const SizedBox(
            width: 170,
            height: 60,
          );
  }

  var skip = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'JannaLT',
        ),
      ),
      SizedBox(width: 15),
      Icon(Icons.auto_awesome_outlined),
    ],
  );
}
