import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/quiz_screen.dart';

class WrongAnswerScreen extends StatefulWidget {
  WrongAnswerScreen({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  State<WrongAnswerScreen> createState() => _WrongAnswerScreenState();
}

class _WrongAnswerScreenState extends State<WrongAnswerScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.clear,
                size: 40,
              ),
            ),
          ]),
      backgroundColor: mainColor,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                spawnOpacity: 0.0,
                opacityChangeRate: 0.25,
                minOpacity: 0.1,
                maxOpacity: .8,
                particleCount: 20,
                spawnMaxRadius: 15.0,
                spawnMaxSpeed: 100.0,
                spawnMinSpeed: 30,
                spawnMinRadius: 7.0,
                baseColor: Colors.white)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Text(
              'Oops...Wrong answer',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            width: 170,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizScreen(token: widget.token)));
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
                'Try Again',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                  fontFamily: 'JannaLT',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
