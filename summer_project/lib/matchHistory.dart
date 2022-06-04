import 'package:flutter/material.dart';
import 'package:summer_project/mHCard.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchStats.dart';

class MatchHistoryWidget extends StatelessWidget {
  final List<MatchStats>? matchHistoryList;
  final String? summonerName;

  MatchHistoryWidget({Key? key, this.matchHistoryList, this.summonerName})
      : super(key: key);

  int findPersonUsingLoop(List<Participants>? people, String? summonerName) {
    for (var i = 0; i < people!.length; i++) {
      if (people[i].summonerName == summonerName) {
        // Found the person, stop the loop
        return i;
      }
    }
    return 0;
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Container(
        width: 750,
        height: 1000,
        child: ListView.builder(
          itemCount: matchHistoryList!.length,
          itemBuilder: (context, index) {
            int player = findPersonUsingLoop(
                matchHistoryList![index].info?.participants!, summonerName);
            return MHCard(
              people: matchHistoryList![index].info?.participants!,
              gameType: matchHistoryList![index].info?.gameType,
              date: matchHistoryList![index].info?.gameEndTimestamp.toString(),
              summoner1: getSummonerNameByID(matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .summoner1Id),
              summoner2: getSummonerNameByID(matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .summoner2Id),
              mastery1: "FirstStrike",
              //print(matchHistoryList![index].metadata!.participants![player].runes);
              //gör en autogenerad klass av runes json response!
              mastery2: "7201_Precision",
              item1:
                  //"1001",
                  matchHistoryList![index]
                      .info
                      ?.participants![player]
                      .item0
                      .toString(),
              item2: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item1
                  .toString(),
              item3: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item2
                  .toString(),
              item4: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item3
                  .toString(),
              item5: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item4
                  .toString(),
              item6: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item5
                  .toString(),
              trinket: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .item6
                  .toString(),
              champion: matchHistoryList![index]
                  .info
                  ?.participants![player]
                  .championName,
              kills: matchHistoryList![index].info?.participants![player].kills,
              deaths:
                  matchHistoryList![index].info?.participants![player].deaths,
              assists:
                  matchHistoryList![index].info?.participants![player].assists,
              win: matchHistoryList![index].info?.participants![player].win,
            );
          },
        ),
      ),
    );
  }
}
