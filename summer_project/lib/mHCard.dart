import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/itemBox.dart';
import 'package:summer_project/matchParticipants.dart';
import 'package:summer_project/matchStats.dart';

class MHCard extends StatelessWidget {
  final String? gameType;
  final String? date;
  //gör alla dessa under till egna klasser
  final String? summoner1;
  final String? summoner2;
  final String? mastery1;
  final String? mastery2;
  final String? item1;
  final String? item2;
  final String? item3;
  final String? item4;
  final String? item5;
  final String? item6;
  final String? trinket;
  final String? champion;
  final int? kills;
  final int? deaths;
  final int? assists;
  final bool? win;
  final List<Participants>? people;

  MHCard(
      {Key? key,
      required this.gameType,
      required this.date,
      required this.summoner1,
      required this.summoner2,
      required this.mastery1,
      required this.mastery2,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4,
      required this.item5,
      required this.item6,
      required this.trinket,
      required this.champion,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.win,
      required this.people})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: win!
          ? Color(0xFF6082B6).withOpacity(0.3)
          : Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage("assets/img/champion/${champion}.png"))),

              //AssetImage("assets/img/champion/${champion}.png")
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child:
                              Image.asset("assets/img/spell/${summoner1}.png"),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child:
                              Image.asset("assets/img/spell/${summoner2}.png"),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset("assets/runesImg/${mastery1}.png"),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset("assets/runesImg/${mastery2}.png"),
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
                            ItemBox(itemID: item1),
                            ItemBox(itemID: item2),
                            ItemBox(itemID: item3),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: AssetImage(
                                          //3363 blue trink
                                          "assets/img/item/${trinket}.png"))),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ItemBox(itemID: item4),
                            ItemBox(itemID: item5),
                            ItemBox(itemID: item6),
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
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 95,
                          width: 95,
                          child: Column(
                            children: [
                              //list[0].playerName;
                              //list[0].champion;
                              MatchParticipants(
                                  champion: people![0].championName,
                                  playerName: people![0].summonerName),
                              MatchParticipants(
                                  champion: people![1].championName,
                                  playerName: people![1].summonerName),
                              MatchParticipants(
                                  champion: people![2].championName,
                                  playerName: people![2].summonerName),
                              MatchParticipants(
                                  champion: people![3].championName,
                                  playerName: people![3].summonerName),
                              MatchParticipants(
                                  champion: people![4].championName,
                                  playerName: people![4].summonerName),
                            ],
                          ),
                        ),
                        Container(
                          height: 95,
                          width: 95,
                          child: Column(
                            children: [
                              //list[0].playerName;
                              //list[0].champion;
                              MatchParticipants(
                                  champion: people![5].championName,
                                  playerName: people![5].summonerName),
                              MatchParticipants(
                                  champion: people![6].championName,
                                  playerName: people![6].summonerName),
                              MatchParticipants(
                                  champion: people![7].championName,
                                  playerName: people![7].summonerName),
                              MatchParticipants(
                                  champion: people![8].championName,
                                  playerName: people![8].summonerName),
                              MatchParticipants(
                                  champion: people![9].championName,
                                  playerName: people![9].summonerName),
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
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GlowText(
                              kills.toString(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            GlowText(
                              " / ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            GlowText(
                              deaths.toString(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            GlowText(
                              " / ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            GlowText(
                              assists.toString(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          gameType!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: win!
                                ? Color(0xFF6082B6).withOpacity(0.8)
                                : Color.fromRGBO(255, 82, 82, 1)
                                    .withOpacity(0.8),
                          ),
                        ),
                        Text(
                          date!,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
