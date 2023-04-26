import 'package:flutter/material.dart';
import 'package:summer_project/match-history/components/itemBox.dart';
import 'package:summer_project/util/kdaWidget.dart';
import 'package:summer_project/generated-classes/matchStats.dart';

class MatchParticipantsExtended extends StatelessWidget {
  final Participants? player;
  final bool? blueTeam;
  final bool? support;

  const MatchParticipantsExtended({
    Key? key,
    this.player,
    this.blueTeam = true,
    this.support = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: blueTeam!
            ? const Color(0xFF6082B6).withOpacity(0.3)
            : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45.0 * 0.7,
                  width: 45.0 * 0.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/smallChampIcon/${player?.championName}.png"))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20 * 0.7,
                      width: 20 * 0.7,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                            "assets/img/spell/${player?.summoner1Id}.png"),
                      ),
                    ),
                    SizedBox(
                      height: 20 * 0.7,
                      width: 20 * 0.7,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                            "assets/img/spell/${player?.summoner2Id}.png"),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20 * 0.7,
                      width: 20 * 0.7,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                            "assets/runesImg/${player?.perks?.styles?[0].selections?[0].perk}.png"),
                      ),
                    ),
                    SizedBox(
                      height: 20 * 0.7,
                      width: 20 * 0.7,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child:
                            Image.asset("assets/runesImg/7201_Precision.png"),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15 * 0.7,
                          width: 50 * 0.7,
                          child: Text(
                            (player?.summonerName != null)
                                ? player!.summonerName!
                                : "NameError",
                            style: const TextStyle(
                                fontSize: 14 * 0.7, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        KdaWidget(
                          kills: player?.kills,
                          deaths: player?.deaths,
                          assists: player?.assists,
                          gamesPlayed: 1,
                          size: 14 * 0.7,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ItemBox(
                          itemID: player?.item0.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item1.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item2.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item3.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item4.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item5.toString(),
                          size: 20 * 0.7,
                        ),
                        ItemBox(
                          itemID: player?.item6.toString(),
                          size: 20 * 0.7,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                        text: player!.totalDamageDealtToChampions.toString(),
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
                        text: (player!.totalMinionsKilled! +
                                player!.neutralMinionsKilled!)
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
              ],
            ),
          ],
        ));
  }
}
