import 'dart:io';
import 'package:share_plus/share_plus.dart';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:http/http.dart' as http;

class WinScreen extends StatefulWidget {
  WinScreen({Key? key, required this.score, required this.token})
      : super(key: key);
  String score;
  String token;
  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> with TickerProviderStateMixin {
  final timeNow = getFormattedDate(DateTime.now().toString());
  late Map log = {
    'date': timeNow,
  };

  @override
  void initState() {
    super.initState();
    updateScore(widget.score, widget.token);
  }

  updateScore(String score, String token) async {
    final Map<String, String> bodyParams = {
      "score": widget.score,
    };

    var client = http.Client();
    var url = getUri('https://quizu.okoul.com/Score');
    var response = await client.post(url,
        body: bodyParams,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
  }

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
                    particleCount: 100,
                    spawnMaxRadius: 15.0,
                    spawnMaxSpeed: 100.0,
                    spawnMinSpeed: 100,
                    spawnMinRadius: 7.0,
                    baseColor: Color.fromARGB(255, 218, 210, 134))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.celebration,
                  size: 100,
                  color: Color.fromARGB(255, 218, 210, 134),
                ),
                AlertDialog(
                  backgroundColor: Colors.white70,
                  scrollable: true,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'You have completed',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'JannaLT',
                            color: mainColor),
                      ),
                      Text(
                        widget.score,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JannaLT',
                            color: mainColor),
                      ),
                      Text(
                        'Correct answers !',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'JannaLT',
                            color: mainColor),
                      ),
                      TextButton(
                          onPressed: () => shareScore(),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color?>(
                                Colors.white10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                size: 36,
                                color: mainColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Share',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JannaLT',
                                    color: mainColor),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }

  void shareScore() {
    String message =
        "I have completed ${widget.score} in Okoul's QuizU challenge !!";
    Share.share(message);
  }
}
