import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/match-history/itemBox.dart';
import 'package:summer_project/util/kdaWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/match-history/matchParticipants.dart';
import 'package:summer_project/match-history/matchParticipantsExtended.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

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
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3 * 0.7, 0, 0),
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
                    height: 100.0 * 0.7,
                    width: 100.0 * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/img/champion/${widget.player?.championName}.png"),
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
              Padding(
                padding:
                    const EdgeInsets.fromLTRB(5 * 0.7, 10 * 0.7, 5 * 0.7, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 45 * 0.7,
                          width: 45 * 0.7,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/img/spell/${widget.player?.summoner1Id}.png"),
                          ),
                        ),
                        SizedBox(
                          height: 45 * 0.7,
                          width: 45 * 0.7,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/img/spell/${widget.player?.summoner2Id}.png"),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5 * 0.7, 0, 0, 0),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 45 * 0.7,
                          width: 45 * 0.7,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[0].perk}.png"),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 22 * 0.7,
                              width: 22 * 0.7,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                    "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[1].perk}.png"),
                              ),
                            ),
                            SizedBox(
                              height: 22 * 0.7,
                              width: 22 * 0.7,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                    "assets/runesImg/${widget.player?.perks?.styles?[0].selections?[2].perk}.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22 * 0.7,
                          width: 22 * 0.7,
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
                          height: 35 * 0.7,
                          width: 35 * 0.7,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                                "assets/runesImg/${widget.player?.perks?.styles?[1].selections?[0].perk}.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 5 * 0.7, 0, 0),
                        ),
                        SizedBox(
                          height: 35 * 0.7,
                          width: 35 * 0.7,
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
                      padding: const EdgeInsets.fromLTRB(0, 10 * 0.7, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ItemBox(itemID: widget.player?.item0.toString()),
                              ItemBox(itemID: widget.player?.item1.toString()),
                              ItemBox(itemID: widget.player?.item2.toString()),
                              Container(
                                height: 35 * 0.7,
                                width: 35 * 0.7,
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
                      thickness: 2 * 0.7,
                      indent: 10 * 0.7,
                      endIndent: 20 * 0.7,
                      width: 10 * 0.7,
                      color: Colors.black.withOpacity(0.5),
                      //color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10 * 0.7,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 95 * 0.7,
                            width: 95 * 0.7,
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
                            height: 95 * 0.7,
                            width: 95 * 0.7,
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
                        thickness: 2 * 0.7,
                        indent: 10 * 0.7,
                        endIndent: 20 * 0.7,
                        width: 10 * 0.7,
                        color: Colors.black.withOpacity(0.5)
                        //color: Colors.grey,
                        ),
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
                              fontSize: 20 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: widget.player!.win!
                                  ? const Color(0xFF6082B6).withOpacity(0.8)
                                  : const Color.fromRGBO(255, 82, 82, 1)
                                      .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Length: " +
                                (widget.matchStats!.info!.gameDuration! / 60)
                                    .toStringAsFixed(1) +
                                "min",
                            style: TextStyle(
                                fontSize: 16 * 0.7,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: widget.date.hour < 10
                                      ? "0" + widget.date.hour.toString() + ":"
                                      : widget.date.hour.toString() + ":",
                                  style: TextStyle(
                                      fontSize: 16 * 0.7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.withOpacity(0.8)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.date.minute < 10
                                          ? "0" +
                                              widget.date.minute.toString() +
                                              " "
                                          : widget.date.minute.toString() + " ",
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: widget.date.year.toString() + "-",
                                  style: TextStyle(
                                      fontSize: 16 * 0.7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.withOpacity(0.8)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.date.month < 10
                                          ? "0" +
                                              widget.date.month.toString() +
                                              "-"
                                          : widget.date.month.toString() + "-",
                                    ),
                                    TextSpan(
                                      text: widget.date.day < 10
                                          ? "0" + widget.date.day.toString()
                                          : widget.date.day.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
