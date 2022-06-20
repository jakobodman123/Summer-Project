import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/itemBox.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchParticipants.dart';
import 'package:summer_project/matchParticipantsExtended.dart';
import 'package:summer_project/matchStats.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class MHCard extends StatefulWidget {
  final List<MatchStats>? matchHistoryList;
  final MatchStats? matchStats;
  final String? summonerName;
  final int matchID;
  final Participants? player;

  const MHCard({
    Key? key,
    this.matchStats,
    this.summonerName,
    required this.matchID,
    this.matchHistoryList,
    this.player,
  }) : super(key: key);

  @override
  MHCardState createState() => MHCardState();
}

class MHCardState extends State<MHCard> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  late int playerIndex = 0;
  //Participants? player = Participants();
  String date = "Today";

  @override
  void initState() {
    super.initState();
  }

  String getSummonerNameByID(int? summonerID) {
    String summonerName = "";

    if (summonerID == 21) {
      summonerName = "SummonerBarrier";
    }
    if (summonerID == 1) {
      summonerName = "SummonerBoost";
    }
    if (summonerID == 14) {
      summonerName = "SummonerDot";
    }
    if (summonerID == 3) {
      summonerName = "SummonerExhaust";
    }
    if (summonerID == 4) {
      summonerName = "SummonerFlash";
    }
    if (summonerID == 6) {
      summonerName = "SummonerHaste";
    }
    if (summonerID == 7) {
      summonerName = "SummonerHeal";
    }
    if (summonerID == 11) {
      summonerName = "SummonerSmite";
    }
    if (summonerID == 12) {
      summonerName = "SummonerTeleport";
    }
    if (summonerID == 39) {
      summonerName = "SummonerSnowball";
    }
    if (summonerID == 32) {
      summonerName = "SummonerSnowball";
    }
    if (summonerID == 13) {
      summonerName = "SummonerMana";
    }

    return summonerName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      child: ExpansionTileCard(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        baseColor: widget.player!.win!
            ? const Color(0xFF6082B6).withOpacity(0.3)
            : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        expandedColor: widget.player!.win!
            ? const Color(0xFF6082B6).withOpacity(0.3)
            : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        key: cardA,
        leading: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/img/champion/${widget.player?.championName}.png"))),

                    //AssetImage("assets/img/champion/${champion}.png")
                  ),
                  Text(
                    widget.player!.champLevel.toString(),
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/img/spell/${widget.player?.summoner1Id}.png"),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/img/spell/${widget.player?.summoner2Id}.png"),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[0].perk}.png"),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                    "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[1].perk}.png"),
                              ),
                            ),
                            SizedBox(
                              height: 22,
                              width: 22,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                    "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[2].perk}.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22,
                          width: 22,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[3].perk}.png"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[1].selections?[0].perk}.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[1].selections?[1].perk}.png"),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                        thickness: 2,
                        indent: 10,
                        endIndent: 20,
                        width: 10,
                        color: Colors.black.withOpacity(0.5)
                        //color: Colors.grey,
                        ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ItemBox(itemID: widget.player?.item0.toString()),
                              ItemBox(itemID: widget.player?.item1.toString()),
                              ItemBox(itemID: widget.player?.item2.toString()),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: AssetImage(
                                            //3363 blue trink
                                            "assets/img/item/${widget.player?.item6.toString()}.png"))),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ItemBox(itemID: widget.player?.item3.toString()),
                              ItemBox(itemID: widget.player?.item4.toString()),
                              ItemBox(itemID: widget.player?.item5.toString()),
                            ],
                          ),
                          //borde göra listor för de man spelat med
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 20,
                      width: 10,
                      color: Colors.black.withOpacity(0.5),
                      //color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 95,
                            width: 95,
                            child: Column(
                              children: [
                                //list[0].playerName;
                                //list[0].champion;
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[0]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[0]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[1]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[1]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[2]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[2]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[3]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[3]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[4]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[4]
                                      .summonerName,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 95,
                            width: 95,
                            child: Column(
                              children: [
                                //list[0].playerName;
                                //list[0].champion;
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[5]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[5]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[6]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[6]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[7]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[7]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[8]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[8]
                                      .summonerName,
                                ),
                                MatchParticipants(
                                  champion: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[9]
                                      .championName,
                                  playerName: widget
                                      .matchHistoryList![widget.matchID]
                                      .info
                                      ?.participants?[9]
                                      .summonerName,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                        thickness: 2,
                        indent: 10,
                        endIndent: 20,
                        width: 10,
                        color: Colors.black.withOpacity(0.5)
                        //color: Colors.grey,
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        children: [
                          KdaWidget(
                            kills: widget.player!.kills,
                            deaths: widget.player!.deaths,
                            assists: widget.player!.assists,
                            gamesPlayed: 1,
                            size: 26,
                          ),
                          Text(
                            widget.matchHistoryList?[widget.matchID].info
                                        ?.queueId !=
                                    null
                                ? getGameTypeFromID(widget
                                    .matchHistoryList?[widget.matchID]
                                    .info
                                    ?.queueId)
                                : "Game",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: widget.player!.win!
                                  ? const Color(0xFF6082B6).withOpacity(0.8)
                                  : const Color.fromRGBO(255, 82, 82, 1)
                                      .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                    /*
                    Icon(
                      Icons.expand_circle_down,
                      size: 40,
                    )
                    */
                  ],
                ),
              ),
            ],
          ),
        ),
        children: <Widget>[
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Container(
            color: colorGrey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Blue Team",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Red Team",
                    style: TextStyle(color: Colors.red),
                  ),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[0],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[1],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[2],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[3],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[4],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[5],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[6],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[7],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[8],
                  ),
                  MatchParticipantsExtended(
                    player: widget.matchHistoryList![widget.matchID].info
                        ?.participants?[9],
                  ),
                ],
              ),
            ],
          ),
        ],
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
