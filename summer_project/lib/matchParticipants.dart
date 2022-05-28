import 'package:flutter/material.dart';

class MatchParticipants extends StatelessWidget {
  final String champion;
  final String playerName;

  const MatchParticipants(
      {Key? key, required this.champion, required this.playerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 15,
          width: 20,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/img/champion/${champion}.png"),
          ),
        ),
        Container(
          height: 15,
          width: 75,
          child: Text(
            playerName,
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
