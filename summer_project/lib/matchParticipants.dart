import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchStats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:summer_project/searchPage.dart';

class MatchParticipants extends StatelessWidget {
  final String? champion;
  final String? playerName;
  final String server = "EUW1";

  Future<Rank> getRankInfos2MP({String? summonerID}) async {
    var url =
        'https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerID?api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.body.toString() != '[]') {
      return Rank.fromJson(
        json.decode(
          response.body,
        )[1],
      );
    } else {
      return Rank(
          hotStreak: false,
          leagueId: '0',
          leaguePoints: 0,
          losses: 0,
          wins: 0,
          rank: 'unranked',
          tier: 'no tier');
    }
  }

  Future<List<MatchStats>?> getGameHistoryMP(
      {String? puuid, int start = 0, int count = 20}) async {
    String europe = "europe";
    var url =
        'https://$europe.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?start=$start&count=$count&api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    final matchIdList = json.decode(response.body);
    print(matchIdList);
    List<MatchStats>? matchHistoryList = [];
    for (String id in matchIdList) {
      var url =
          'https://$europe.api.riotgames.com/lol/match/v5/matches/$id?api_key=$apiToken';
      var response = await http.get(
        Uri.parse(url),
      );
      final match = json.decode(response.body);
      //print("\nID: $id");
      //print(match);
      //print("---");
      matchHistoryList.add(
        MatchStats.fromJson(json.decode(json.encode(match))),
      );
    }

    return matchHistoryList;
  }

  const MatchParticipants({Key? key, this.champion, this.playerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () async {
        final league = League(apiToken: apiToken, server: server);
        var summoner = await league.getSummonerInfo(summonerName: playerName);

        if (1 == 1) {
          String? accID = summoner.accID;
          int? level = summoner.level;
          int? profileIconID = summoner.profileIconID;
          String? puuid = summoner.puuid;
          String? summmonerID = summoner.summonerID;
          String? summonerName = summoner.summonerName;
          Rank? ranksoloQ = await league.getRankInfos(summonerID: summmonerID);
          print(summoner);

          Rank? rankFlex = await getRankInfos2MP(summonerID: summmonerID);

          List<ChampionMastery>? masteryList =
              await league.getChampionMasteries(summonerID: summmonerID);

          List<MatchStats>? matchHistory = await getGameHistoryMP(
            puuid: summoner.puuid,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TestPage(
                      accID: accID,
                      level: level,
                      profileIconID: profileIconID,
                      puuid: puuid,
                      summonerID: summmonerID,
                      summonerName: summonerName,
                      server: server,
                      soloQRank: ranksoloQ,
                      flexRank: rankFlex,
                      masteryList: masteryList,
                      matchHistoryList: matchHistory,
                    )),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 15,
            width: 20,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset("assets/img/champion/${champion}.png"),
            ),
          ),
          Container(
            height: 15,
            width: 75,
            child: Text(
              (playerName != null) ? playerName! : "NameError",
              style: const TextStyle(fontSize: 14.0, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
