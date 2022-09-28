import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final CustomTimerController _controller = CustomTimerController();
  bool lowTimer = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.start();
    Future.delayed(const Duration(minutes: 1), () => 0)
        .then((_) => lowTimer = true);
  }

  @override
  Widget build(BuildContext context) {
    return mounted ? buildTime() : const SizedBox();
  }

  Widget buildTime() {
    return Center(
      child: CustomTimer(
        controller: _controller,
        begin: const Duration(seconds: 120),
        end: const Duration(),
        builder: (time) {
          return SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  color: lowTimer ? Colors.red : Colors.white,
                  value: double.parse(time.seconds) / 60,
                  strokeWidth: 7,
                ),
                Center(
                  child: Text(
                    '${time.minutes}:${time.seconds}',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'JannaLT',
                        color:
                            time.minutes == '00' && 10 > int.parse(time.seconds)
                                ? Colors.red
                                : Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
        animationBuilder: (child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: child,
          );
        },
      ),
    );
  }
}
