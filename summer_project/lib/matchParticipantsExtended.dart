import 'package:flutter/material.dart';
import 'package:summer_project/itemBox.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/matchStats.dart';

class MatchParticipantsExtended extends StatelessWidget {
  final Participants? player;

  MatchParticipantsExtended({
    Key? key,
    this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/img/champion/${player?.championName}.png"))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              child: FittedBox(
                fit: BoxFit.fill,
                child:
                    Image.asset("assets/img/spell/${player?.summoner1Id}.png"),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              child: FittedBox(
                fit: BoxFit.fill,
                child:
                    Image.asset("assets/img/spell/${player?.summoner2Id}.png"),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("assets/runesImg/FirstStrike.png"),
              ),
            ),
            Container(
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
                Container(
                  height: 15,
                  width: 50,
                  child: Text(
                    (player?.summonerName != null)
                        ? player!.summonerName!
                        : "NameError",
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                KdaWidget(
                  kills: player?.kills,
                  deaths: player?.deaths,
                  assists: player?.assists,
                  gamesPlayed: 1,
                  size: 16,
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
            Text("Dmg: " + player!.totalDamageDealtToChampions.toString()),
            Text("Cs: " + player!.totalMinionsKilled.toString()),
          ],
        ),
      ],
    );
  }
}
