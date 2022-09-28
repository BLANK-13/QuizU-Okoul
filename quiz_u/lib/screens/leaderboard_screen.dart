import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/widgets/leaderboard_places.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'LeaderBoard',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            const SizedBox(height: 35),
            PlacesWidget(
              token: token,
            )
          ],
        ),
      ),
    );
  }
}
