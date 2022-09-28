import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:phone_number/phone_number.dart';
import 'package:quiz_u/constants.dart';
import 'package:quiz_u/screens/OTP_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final countryPicker = const FlCountryCodePicker();
  static final TextEditingController _num = TextEditingController();
  String errorMsg = '';
  CountryCode? countryFlag =
      const CountryCode(name: 'Saudi Arabia', code: 'SA', dialCode: '+966');

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
        child: Column(
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
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Mobile',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'JannaLT',
                          color: Colors.white),
                    ),
                  ],
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
                        controller: _num,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: '\t\t53 555 5555',
                          hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontFamily: 'JannaLT',
                              fontSize: 20),
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              InkWell(
                                onTap: () async {
                                  var _temp = countryFlag;
                                  var flag = await countryPicker.showPicker(
                                      context: context);
                                  flag ??= _temp;
                                  setState(() {
                                    countryFlag = flag;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      /// country flag container
                                      child: countryFlag != null
                                          ? countryFlag!.flagImage
                                          : const SizedBox(),
                                    ),
                                    const SizedBox(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      ),
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                    errorMsg,
                    style: TextStyle(
                      color: Colors.red[600],
                      fontFamily: 'JannaLT',
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_num.text.isEmpty || _num.text.length < 9) {
                        setState(() {
                          errorMsg = 'Please enter the number correctly';
                        });
                      } else {
                        String phoneNo = countryFlag!.dialCode + _num.text;
                        String formatted;
                        try {
                          bool isValid =
                              await PhoneNumberUtil().validate(phoneNo);
                          formatted = await PhoneNumberUtil()
                              .format(phoneNo, countryFlag!.dialCode);
                          PhoneNumber phoneNumber =
                              await PhoneNumberUtil().parse(phoneNo);
                        } catch (_) {
                          setState(() {
                            errorMsg = 'Please enter the number correctly';
                          });
                        }

                        if (await PhoneNumberUtil().validate(phoneNo) ==
                            false) {
                          setState(() {
                            errorMsg = 'Please enter the number correctly';
                          });
                        } else {
                          setState(() {
                            errorMsg = '';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen(
                                        phoneNo: _num.text,
                                      )));
                        }
                      }
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
                      'Start',
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
