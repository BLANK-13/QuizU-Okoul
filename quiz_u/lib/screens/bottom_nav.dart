import 'package:flutter/material.dart';
import 'package:quiz_u/models/user.dart';
import 'package:quiz_u/screens/home_screen.dart';
import 'package:quiz_u/screens/leaderboard_screen.dart';
import 'package:quiz_u/screens/profile_screen.dart';

import '../constants.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int currentP = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.user.token);
    print(widget.user.name);
    print(widget.user.mobile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .8,
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: const Center(
          child: Text(
            'QuizU ⏳',
            style: TextStyle(
                fontFamily: 'JannaLT',
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
      backgroundColor: mainColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontFamily: 'JannaLt'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'JannaLt'),
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            backgroundColor: mainColor,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.leaderboard),
            backgroundColor: mainColor,
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              backgroundColor: mainColor,
              label: 'Me')
        ],
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: false,
        currentIndex: currentP,
        onTap: (index) {
          setState(() {
            currentP = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentP,
        children: [
          HomeScreen(token: widget.user.token, name: widget.user.name),
          LeaderboardScreen(token: widget.user.token),
          ProfileScreen(name: widget.user.name, phoneNo: widget.user.mobile),
        ],
      ),
    );
  }
}
