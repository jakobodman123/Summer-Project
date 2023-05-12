import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/percent_indicator.dart';
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

import '../helpClasses/supportMethods.dart';
import 'components/item_section.dart';
import 'components/top_section.dart';
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
  List<Widget> blueTeamWidgets = [];
  List<Widget> redTeamWidgets = [];

  @override
  void initState() {
    super.initState();
    setParticipantLists();
  }

  void setParticipantLists() {
    for (int i = 0; i < 5; i++) {
      blueTeamWidgets.add(MatchParticipantsExtended(
        player: widget.matchHistoryList![widget.matchID].info?.participants?[i],
        blueTeam: true,
      ));
    }

    for (int i = 5; i < 10; i++) {
      redTeamWidgets.add(MatchParticipantsExtended(
        player: widget.matchHistoryList![widget.matchID].info?.participants?[i],
        blueTeam: false,
      ));
    }
  }

  void _handleValueChanged(bool newValue) {
    setState(() {
      _isExpanded = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    int cs = widget.player!.totalMinionsKilled! +
        widget.player!.neutralMinionsKilled!;
    return Card(
      elevation: 5,
      color: widget.player!.win!
          ? const Color(0xFF6082B6).withOpacity(0.3)
          : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
      child: Column(
        children: [
          TopSection(
            win: widget.player!.win!,
            queueId: widget.matchHistoryList?[widget.matchID].info?.queueId,
            gameDuration: widget.matchStats!.info!.gameDuration!,
            date: widget.date,
            onValueChanged: _handleValueChanged,
            isExpanded: _isExpanded,
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
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
                ],
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
                padding: const EdgeInsets.only(left: 2, right: 4),
                child: Column(
                  children: [
                    KdaWidget(
                      kills: widget.player!.kills,
                      deaths: widget.player!.deaths,
                      assists: widget.player!.assists,
                      gamesPlayed: 1,
                      size: 26 * 0.7,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Dmg: ",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: widget.player!.totalDamageDealtToChampions
                                .toString(),
                            style: const TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Cs: ",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: cs.toString(),
                            style: const TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Gold: ",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: widget.player!.goldEarned.toString(),
                            style: const TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 13 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isExpanded)
            Container(
              height: 1,
              color: Colors.black,
            ),
          if (_isExpanded)
            Container(
              color: widget.player!.win!
                  ? const Color(0xFF6082B6).withOpacity(0)
                  : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: blueTeamWidgets,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: redTeamWidgets,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
