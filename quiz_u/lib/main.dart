import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizU by Saud',
      theme: ThemeData(primaryColor: mainColor),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
