import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/models/user.dart';
import 'package:quiz_u/models/user_response.dart';
import 'package:quiz_u/screens/bottom_nav.dart';
import 'package:quiz_u/screens/name_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNo;
  const OTPScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final TextEditingController _pin = TextEditingController();
  // String errorMsg = '';
  Map<String, dynamic>? userLoggedIn;
  late User user;
  bool isLoading = false;

  login(String otp) async {
    var status = await UserResponse().postLogin(widget.phoneNo, otp: otp);

    /// we will use this single request to get all the neccecery info and send it to home screen and profile screen to avoid unneccecery requests.
    if (status != false) {
      user = User(
          mobile: widget.phoneNo, token: status['token'], name: status['name']);
      userLoggedIn = status;
      if (status['user_status'] == 'new') {
        return 1;
      } else {
        /// will use 0 and 1 to determine if the user is new or not
        return 0;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'QuizU ⏳',
                        style: TextStyle(
                            fontFamily: 'JannaLT',
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Text(
                              'Please enter the OTP sent to your mobile ${widget.phoneNo}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'JannaLT',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Pinput(
                          controller: _pin,
                          length: 4,
                          submittedPinTheme: const PinTheme(
                              textStyle: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'JannaLT',
                          )),
                          closeKeyboardWhenCompleted: true,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't receive the code?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JannaLT',
                                color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Hint: OTP is always 0000 :)',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JannaLT',
                                      color: mainColor),
                                ),
                                duration: const Duration(seconds: 4),
                              ));
                            }, // Supposed to be resend in case of Firebase..,
                            child: const Text(
                              " Resend",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'JannaLT',
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 45,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            var switchCase;
                            if (_pin.text.isEmpty) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Enter an OTP',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JannaLT',
                                      color: mainColor),
                                ),
                                duration: const Duration(seconds: 4),
                              ));
                              return;
                            }
                            try {
                              switchCase = await login(_pin.text);
                              print(switchCase);
                            } catch (_) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Something went Wrong',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JannaLT',
                                      color: mainColor),
                                ),
                                duration: const Duration(seconds: 4),
                              ));
                            }
                            switch (switchCase) {
                              case 0:

                                /// 0 represents a returning user in which they will be directed to Home screen.
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(const Duration(seconds: 1), () {
                                  // extra second to make sure the user gets the full 2 minutes.
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomBarWidget(
                                                user: user,
                                              )));
                                  FocusScope.of(context).unfocus();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      'Login successful welcome back !',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'JannaLT',
                                          color: mainColor),
                                    ),
                                    duration: const Duration(seconds: 4),
                                  ));
                                });

                                break;
                              case 1:

                                /// 1 represents the new user which will be directed to choose a name.

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NameScreen(
                                              user: user,
                                            )));
                                break;
                              case false: // OTP is false
                                FocusScope.of(context).unfocus();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.white,
                                  content: Text(
                                    'Wrong OTP number',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'JannaLT',
                                        color: mainColor),
                                  ),
                                  duration: const Duration(seconds: 4),
                                ));
                                break;
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                Colors.grey[350]),
                          ),
                          child: Text(
                            'Check',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 20,
                              fontFamily: 'JannaLT',
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
