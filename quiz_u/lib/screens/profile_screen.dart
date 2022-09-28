import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/login_screen.dart';
import 'package:quiz_u/widgets/profile_previous.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key, required this.name, required this.phoneNo})
      : super(key: key);
  String? name;
  String? phoneNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: ListTile(
                trailing: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Icon(
                    Icons.logout_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            const SizedBox(height: 40),
            Text(
              'Name: ${name ?? ''}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            Text(
              'Mobile: ${phoneNo ?? '0500000000'}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            const SizedBox(
              height: 75,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.white24,
            ),
            const SizedBox(height: 20),
            const Text(
              'My Scores',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            const PreviousScores(),
          ],
        ),
      ),
    );
  }
}
