import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/match-history/components/itemBox.dart';
import 'package:summer_project/match-history/components/rune_section.dart';
import 'package:summer_project/match-history/components/summoner_spells.dart';
import 'package:summer_project/util/kdaWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/match-history/components/matchParticipant.dart';
import 'package:summer_project/match-history/matchParticipantsExtended.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:summer_project/util/match_date.dart';

import 'components/item_section.dart';
import 'match_participants_section.dart';

class MHCard extends StatefulWidget {
  final List<MatchStats>? matchHistoryList;
  final MatchStats? matchStats;
  final String? summonerName;
  final int matchID;
  final Participants? player;
  final DateTime date;

  const MHCard({
    Key? key,
    this.matchStats,
    this.summonerName,
    required this.matchID,
    this.matchHistoryList,
    this.player,
    required this.date,
  }) : super(key: key);

  @override
  MHCardState createState() => MHCardState();
}

class MHCardState extends State<MHCard> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Card(
        elevation: 5,
        color: widget.player!.win!
            ? const Color(0xFF6082B6).withOpacity(0.3)
            : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.matchHistoryList?[widget.matchID].info?.queueId != null
                      ? "  " +
                          getGameTypeFromID(widget
                              .matchHistoryList?[widget.matchID].info?.queueId)
                      : "Game",
                  style: TextStyle(
                    shadows: const [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                    fontSize: 20 * 0.7,
                    fontWeight: FontWeight.bold,
                    color: widget.player!.win!
                        ? const Color(0xFF6082B6).withOpacity(0.8)
                        : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.8),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      (widget.matchStats!.info!.gameDuration! / 60)
                              .toStringAsFixed(0) +
                          "min",
                      style: TextStyle(
                          fontSize: 16 * 0.7,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8)),
                    ),
                    MatchDate(date: widget.date),
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 90.0 * 0.7,
                      width: 90.0 * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/${widget.player?.championId}.png"),
                        ),
                      ),
                    ),
                    Text(
                      widget.player!.champLevel.toString(),
                      style: const TextStyle(
                          fontSize: 24 * 0.7,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SummonerSpells(
                  summoner1Id: widget.player?.summoner1Id,
                  summoner2Id: widget.player?.summoner2Id,
                ),
                RuneSection(
                  styles: widget.player?.perks?.styles,
                ),
                ItemSection(
                  player: widget.player,
                ),
                ResponsiveVisibility(
                    hiddenWhen: const [
                      Condition.smallerThan(name: TABLET),
                    ],
                    child: MatchParticipants(
                        participants: widget.matchHistoryList![widget.matchID]
                            .info?.participants)),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      KdaWidget(
                        kills: widget.player!.kills,
                        deaths: widget.player!.deaths,
                        assists: widget.player!.assists,
                        gamesPlayed: 1,
                        size: 26 * 0.7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isExpanded)
              Container(
                color: widget.player!.win!
                    ? const Color(0xFF6082B6).withOpacity(0.3)
                    : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[0],
                          blueTeam: true,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[1],
                          blueTeam: true,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[2],
                          blueTeam: true,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[3],
                          blueTeam: true,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[4],
                          blueTeam: true,
                          support: true,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[5],
                          blueTeam: false,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[6],
                          blueTeam: false,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[7],
                          blueTeam: false,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[8],
                          blueTeam: false,
                        ),
                        MatchParticipantsExtended(
                          player: widget.matchHistoryList![widget.matchID].info
                              ?.participants?[9],
                          blueTeam: false,
                          support: true,
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  String getGameTypeFromID(int? queueId) {
    String gameType = "Game";
    if (queueId != null) {
      switch (queueId) {
        case 420:
          {
            gameType = "Ranked Solo";
          }
          break;

        case 440:
          {
            gameType = "Ranked Flex";
          }
          break;

        case 400:
          {
            gameType = "Normal Draft";
          }
          break;

        case 450:
          {
            gameType = "Aram";
          }
          break;

        default:
          {
            gameType = "Normal Game";
          }
          break;
      }
      return gameType;
    }
    return gameType;
  }
}
