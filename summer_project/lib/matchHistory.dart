import 'package:flutter/material.dart';
import 'package:summer_project/mHCard.dart';

class MatchHistoryWidget extends StatelessWidget {
  List items = getDummyList();

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 750,
        height: 1000,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MHCard(
              gameType: "Ranked Solo 5v5",
              date: "today 2h ago",
              summoner1: "SummonerFlash",
              summoner2: "SummonerHeal",
              mastery1: "FirstStrike",
              mastery2: "7201_Precision",
              item1: "1001",
              item2: "6691",
              item3: "6676",
              item4: "3036",
              item5: "3031",
              item6: "3142",
              trinket: "3363",
              champion: "MissFortune",
              kills: 20,
              deaths: 4,
              assists: 13,
              win: true,
            );
          },
        ));
  }
}
