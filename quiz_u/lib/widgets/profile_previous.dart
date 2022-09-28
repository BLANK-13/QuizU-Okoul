import 'package:flutter/material.dart';
import 'package:quiz_u/constants.dart';

class PreviousScores extends StatelessWidget {
  const PreviousScores({
    Key? key,
  }) : super(key: key);

// TODO do the previous attempts later.
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            leading: const SizedBox(),
            title: Text(
              getFormattedDate('1969-07-20 20:18:04Z'),
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            trailing: const Text(
              '7',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text(
              getFormattedDate('1969-07-20 20:18:04Z'),
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            trailing: const Text(
              '7',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text(
              getFormattedDate('1969-07-20 20:18:04Z'),
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
            trailing: const Text(
              '7',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JannaLT',
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
