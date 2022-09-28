import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/models/name_update.dart';
import 'package:quiz_u/models/user.dart';
import 'package:quiz_u/screens/bottom_nav.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> with TickerProviderStateMixin {
  static final TextEditingController _name = TextEditingController();
  late User userToHome;
  Map<String, dynamic>? userLoggedIn;
  bool isLoading = false;

  update(String mobile, String token, String name) async {
    var status = await NameUpdate().nameUpdate(name, token);
    if (status != false) {
      userToHome = User(mobile: mobile, token: token, name: name);
      userLoggedIn = status;
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'What is your name?',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'JannaLT',
                            color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: const Color(0xFFD1D1D1))),
                        width: double.infinity,
                        height: 67,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JannaLT',
                                  fontSize: 20),
                              controller: _name,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'name',
                                hintStyle: TextStyle(
                                    color: Colors.grey[300],
                                    fontFamily: 'JannaLT',
                                    fontSize: 20),
                                prefixIcon: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const []),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 45,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_name.text.isEmpty) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Please enter a name',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JannaLT',
                                      color: mainColor),
                                ),
                                duration: const Duration(seconds: 4),
                              ));
                            } else {
                              try {
                                await update(
                                  widget.user.mobile,
                                  widget.user.token,
                                  _name.text,
                                );
                                if (userToHome != null) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomBarWidget(
                                                  user: userToHome,
                                                )));

                                    FocusScope.of(context).unfocus();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.white,
                                      content: Text(
                                        'Login successful welcome to QuizU ${_name.text}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JannaLT',
                                            color: mainColor),
                                      ),
                                      duration: const Duration(seconds: 4),
                                    ));
                                  });
                                } else {
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
                            'Done',
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
