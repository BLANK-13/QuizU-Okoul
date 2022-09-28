import 'package:animated_background/animated_background.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => const )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Flexible(
          child: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
                    spawnOpacity: 0.0,
                    opacityChangeRate: 0.25,
                    minOpacity: 0.1,
                    maxOpacity: .8,
                    particleCount: 30,
                    spawnMaxRadius: 15.0,
                    spawnMaxSpeed: 100.0,
                    spawnMinSpeed: 30,
                    spawnMinRadius: 7.0,
                    baseColor: Colors.white)),
            child: const Center(
              child: Text(
                'QuizU by Okoul ⏳',
                style: TextStyle(
                    fontFamily: 'JannaLT',
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: mainColor);
  }
}
