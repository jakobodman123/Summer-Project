import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';

class ChallengesCard extends StatelessWidget {
  final int? challengeID1;
  final int? challengeID2;
  final int? challengeID3;

  const ChallengesCard(
      {Key? key, this.challengeID1, this.challengeID2, this.challengeID3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 200 * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.0 * 0.7,
            width: 50.0 * 0.7,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://raw.communitydragon.org/latest/game/assets/challenges/config/$challengeID1/tokens/grandmaster.png")),
          ),
          SizedBox(
            height: 50.0 * 0.7,
            width: 50.0 * 0.7,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://raw.communitydragon.org/latest/game/assets/challenges/config/$challengeID2/tokens/grandmaster.png")),
          ),
          SizedBox(
            height: 50.0 * 0.7,
            width: 50.0 * 0.7,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://raw.communitydragon.org/latest/game/assets/challenges/config/$challengeID3/tokens/grandmaster.png")),
          ),
        ],
      ),
    );
  }
}
