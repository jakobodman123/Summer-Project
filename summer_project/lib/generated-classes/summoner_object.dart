import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

import 'challenges.dart';
import 'matchStats.dart';
import 'summoner.dart';

class SummonerObject {
  SummonerObject({
    this.summoner,
    this.soloQRank,
    this.flexRank,
    this.matchHistoryList,
    this.matchHistoryTotals,
    this.matchHistoryTotalschamp1,
    this.champsPlayedIds,
    this.matchHistoryTotalschamp2,
    this.matchHistoryTotalschamp3,
    this.matchHistoryTotalschamp4,
    this.lane,
    this.champMasteryList,
    this.challenges,
  });

  //TestPage();
  final Summoner? summoner;
  final Rank? soloQRank;
  final Rank? flexRank;
  List<MatchStats>? matchHistoryList;
  MatchHistoryTotals? matchHistoryTotals;
  MatchHistoryTotals? matchHistoryTotalschamp1;
  MatchHistoryTotals? matchHistoryTotalschamp2;
  MatchHistoryTotals? matchHistoryTotalschamp3;
  MatchHistoryTotals? matchHistoryTotalschamp4;
  List<dynamic>? champsPlayedIds;
  final String? lane;
  final List<ChampionMastery>? champMasteryList;
  final AccountChallenges? challenges;
}
