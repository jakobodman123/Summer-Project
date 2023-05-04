import 'package:flutter/material.dart';
import 'package:summer_project/generated-classes/matchStats.dart';

import 'components/matchParticipant.dart';

class MatchParticipants extends StatelessWidget {
  final List<Participants>? participants;

  const MatchParticipants({Key? key, this.participants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          //height: 95 * 0.7,
          width: 95 * 0.7,
          child: Column(
            children: [
              //list[0].playerName;
              //list[0].champion;
              MatchParticipant(
                championName: participants?[0].championName,
                playerName: participants?[0].summonerName,
              ),
              MatchParticipant(
                championName: participants?[1].championName,
                playerName: participants?[1].summonerName,
              ),
              MatchParticipant(
                championName: participants?[2].championName,
                playerName: participants?[2].summonerName,
              ),
              MatchParticipant(
                championName: participants?[3].championName,
                playerName: participants?[3].summonerName,
              ),
              MatchParticipant(
                championName: participants?[4].championName,
                playerName: participants?[4].summonerName,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 95 * 0.7,
          child: Column(
            children: [
              //list[0].playerName;
              //list[0].champion;
              MatchParticipant(
                championName: participants?[5].championName,
                playerName: participants?[5].summonerName,
              ),
              MatchParticipant(
                championName: participants?[6].championName,
                playerName: participants?[6].summonerName,
              ),
              MatchParticipant(
                championName: participants?[7].championName,
                playerName: participants?[7].summonerName,
              ),
              MatchParticipant(
                championName: participants?[8].championName,
                playerName: participants?[8].summonerName,
              ),
              MatchParticipant(
                championName: participants?[9].championName,
                playerName: participants?[9].summonerName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
