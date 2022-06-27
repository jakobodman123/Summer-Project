import 'package:flutter/material.dart';
import 'package:summer_project/itemBox.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/matchStats.dart';

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
    // TODO: implement build
    return Card(
        color: blueTeam!
            ? const Color(0xFF6082B6).withOpacity(0.3)
            : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/img/champion/${player?.championName}.png"))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                        "assets/img/spell/${player?.summoner1Id}.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
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
                  height: 20,
                  width: 20,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                        "assets/runesImg/${player?.perks?.styles?[0].selections?[0].perk}.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset("assets/runesImg/7201_Precision.png"),
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
                      height: 15,
                      width: 50,
                      child: Text(
                        (player?.summonerName != null)
                            ? player!.summonerName!
                            : "NameError",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    KdaWidget(
                      kills: player?.kills,
                      deaths: player?.deaths,
                      assists: player?.assists,
                      gamesPlayed: 1,
                      size: 14,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ItemBox(
                      itemID: player?.item0.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item1.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item2.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item3.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item4.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item5.toString(),
                      size: 20,
                    ),
                    ItemBox(
                      itemID: player?.item6.toString(),
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Dmg: " + player!.totalDamageDealtToChampions.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  "Cs: " + player!.totalMinionsKilled.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: support!
                  ? FittedBox(
                      fit: BoxFit.fill,
                      child: player?.lane == "NONE"
                          ? const SizedBox()
                          : Image.asset(
                              "assets/rankedIcons/Position_Diamond-Utility.png"),
                    )
                  : FittedBox(
                      fit: BoxFit.fill,
                      child: player?.lane == "NONE"
                          ? const SizedBox()
                          : Image.asset(
                              "assets/rankedIcons/Position_Diamond-${player?.lane}.png"),
                    ),
            ),
          ],
        ));
  }
}
