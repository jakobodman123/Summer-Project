import 'dart:convert';

import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:summer_project/matchStats.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/searchPage.dart';

class ApiMethods {
  String server = "EUW1";
  Future<int> findPersonUsingLoop(
      List<Participants>? people, String? summonerName) async {
    if (people != null && summonerName != null) {
      for (var i = 0; i < people.length; i++) {
        if (people[i].summonerName == summonerName) {
          // Found the person, stop the loop
          return i;
        }
      }
    }
    return 0;
  }

  Future<Rank> getRankInfos2({String? summonerID}) async {
    var url =
        'https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerID?api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    try {
      var rankList = Rank.fromJson(json.decode(
        response.body,
      )[1])
          .tier;

      if (response.body.toString() != '[]') {
        //print(rankList);
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
            rank: '',
            tier: 'Unranked');
      }
    } on RangeError catch (e) {
      return Rank(
          hotStreak: false,
          leagueId: '0',
          leaguePoints: 0,
          losses: 0,
          wins: 0,
          rank: '',
          tier: 'Unranked');
    }
    //else {
  }

  Future<Rank> getRankInfos({String? summonerID}) async {
    var url =
        'https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerID?api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    try {
      var rankList = Rank.fromJson(json.decode(
        response.body,
      )[0])
          .tier;

      if (response.body.toString() != '[]') {
        //print(rankList);
        return Rank.fromJson(
          json.decode(
            response.body,
          )[0],
        );
      } else {
        return Rank(
            hotStreak: false,
            leagueId: '0',
            leaguePoints: 0,
            losses: 0,
            wins: 0,
            rank: '',
            tier: 'Unranked');
      }
    } on RangeError catch (e) {
      return Rank(
          hotStreak: false,
          leagueId: '0',
          leaguePoints: 0,
          losses: 0,
          wins: 0,
          rank: '',
          tier: 'Unranked');
    }
    //else {
  }
}
