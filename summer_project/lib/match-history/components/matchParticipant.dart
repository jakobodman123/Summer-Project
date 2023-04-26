import 'package:flutter/material.dart';

class MatchParticipant extends StatelessWidget {
  final String? championName;
  final String? playerName;
  final String? server = "EUW1";

  const MatchParticipant({Key? key, this.championName, this.playerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15 * 0.7,
            width: 20 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset("assets/smallChampIcon/$championName.png"),
            ),
          ),
          SizedBox(
            height: 15 * 0.7,
            width: 75 * 0.7,
            child: Text(
              (playerName != null) ? playerName! : "NameError",
              style: const TextStyle(fontSize: 14 * 0.7, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
