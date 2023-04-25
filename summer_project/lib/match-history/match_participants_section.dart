import 'package:flutter/material.dart';
import 'package:summer_project/generated-classes/matchStats.dart';

import 'components/matchParticipant.dart';

class MatchParticipants extends StatelessWidget {
  final List<Participants>? participants;

  const MatchParticipants({Key? key, this.participants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 95 * 0.7,
          width: 95 * 0.7,
          child: Column(
            children: [
              //list[0].playerName;
              //list[0].champion;
              MatchParticipant(
                championID: participants?[0].championId,
                playerName: participants?[0].summonerName,
              ),
              MatchParticipant(
                championID: participants?[1].championId,
                playerName: participants?[1].summonerName,
              ),
              MatchParticipant(
                championID: participants?[2].championId,
                playerName: participants?[2].summonerName,
              ),
              MatchParticipant(
                championID: participants?[3].championId,
                playerName: participants?[3].summonerName,
              ),
              MatchParticipant(
                championID: participants?[4].championId,
                playerName: participants?[4].summonerName,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 95 * 0.7,
          width: 95 * 0.7,
          child: Column(
            children: [
              //list[0].playerName;
              //list[0].champion;
              MatchParticipant(
                championID: participants?[5].championId,
                playerName: participants?[5].summonerName,
              ),
              MatchParticipant(
                championID: participants?[6].championId,
                playerName: participants?[6].summonerName,
              ),
              MatchParticipant(
                championID: participants?[7].championId,
                playerName: participants?[7].summonerName,
              ),
              MatchParticipant(
                championID: participants?[8].championId,
                playerName: participants?[8].summonerName,
              ),
              MatchParticipant(
                championID: participants?[9].championId,
                playerName: participants?[9].summonerName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
