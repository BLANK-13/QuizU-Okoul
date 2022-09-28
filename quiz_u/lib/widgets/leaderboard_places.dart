import 'package:flutter/material.dart';
import 'package:quiz_u/models/leaderboard.dart';
import 'package:quiz_u/models/leaderboard_response.dart';

class PlacesWidget extends StatefulWidget {
  PlacesWidget({Key? key, required this.token}) : super(key: key);
  String token;

  @override
  State<PlacesWidget> createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  List<LeaderBoard>? places;

  getPlaces() async =>
      places = await LeaderBoardResponse().getPlaces(widget.token);

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 45, 0),
          leading: places == null
              ? const SizedBox()
              : const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
          title: places == null
              ? const SizedBox()
              : Text(
                  places![index].name,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JannaLT',
                      color: Colors.white),
                ),
          trailing: places == null
              ? const SizedBox()
              : Text(
                  '${places![index].score}',
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JannaLT',
                      color: Colors.white),
                ),
        );
      },
    ));
  }
}
