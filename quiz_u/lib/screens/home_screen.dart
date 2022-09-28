import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.token, required this.name})
      : super(key: key);
  String token;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                width: 364,
                height: 100,
                child: Text(
                  'Ready to test your knoweldge and challenge others?',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'JannaLT',
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              width: 190,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(
                                token: token,
                              )));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.grey[350]),
                ),
                child: Text(
                  'Quiz Me !',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontFamily: 'JannaLT',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: mainColor,
                          scrollable: true,
                          title: const Text(
                            'Rules',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JannaLT',
                                color: Colors.white),
                          ),
                          content: Text(
                            'Answer as many questions as you can within 2 minutes.\n\n You can only skip one question and in case of wrong answer you will need to try again. If you get the highest score you will be shown in the leaderboard.\n\nGoodluck ${name ?? ''} !', // ?? is used in case of null it won't show the name in the 'Show rules' as null it will just be empty.
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JannaLT',
                                color: Colors.white),
                          ),
                        ));
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double?>(10),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.grey[350]),
              ),
              child: Text(
                'Show rules',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                  fontFamily: 'JannaLT',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
