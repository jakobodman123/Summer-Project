import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/accolades/accoladesPage.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/summoner-widgets/challengesCard.dart';
import 'package:summer_project/summoner-widgets/champMasteryCard.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/summoner-widgets/rankedCard.dart';

//https://pbs.twimg.com/media/B8jEndNIYAEavcH.jpg

class MainProfile extends StatefulWidget {
  const MainProfile(
      this.iconID,
      this.level,
      this.summonerName,
      this.summonerID,
      this.soloQRank,
      this.flexQRank,
      this.matchHistoryTotals,
      this.championMasteryList,
      this.challenges);

  final String? iconID; //"4884"
  final String? level;
  final String? summonerName;
  final String? summonerID;
  final Rank? soloQRank;
  final Rank? flexQRank;
  final MatchHistoryTotals? matchHistoryTotals;

  final List<ChampionMastery>? championMasteryList;
  final AccountChallenges? challenges;

  @override
  MainProfileState createState() => MainProfileState();
}

class MainProfileState extends State<MainProfile> {
  bool? hotStreak;
  int? wins;
  int? losses;
  String? rank;
  String? leagueId;
  String? tier;
  int? leaguePoints;
  String? queueType;

  bool? hotStreakFlex;
  int? winsFlex;
  int? lossesFlex;
  String? rankFlex;
  String? leagueIdFlex;
  String? tierFlex;
  int? leaguePointsFlex;
  String? queueTypeFlex;

  @override
  void initState() {
    super.initState();
    hotStreak = widget.soloQRank!.hotStreak;
    wins = widget.soloQRank!.wins;
    losses = widget.soloQRank!.losses;
    rank = widget.soloQRank!.rank;
    leagueId = widget.soloQRank!.leagueId;
    tier = widget.soloQRank!.tier;
    leaguePoints = widget.soloQRank!.leaguePoints;
    hotStreakFlex = widget.flexQRank!.hotStreak;
    winsFlex = widget.flexQRank!.wins;
    lossesFlex = widget.flexQRank!.losses;
    rankFlex = widget.flexQRank!.rank;
    leagueIdFlex = widget.flexQRank!.leagueId;
    tierFlex = widget.flexQRank!.tier;
    leaguePointsFlex = widget.flexQRank!.leaguePoints;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox(
              height: 300 * 0.7,
              width: 300 * 0.7,
              child: Image.network(
                "https://cdn.communitydragon.org/latest/profile-icon/${widget.iconID}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.summonerName!,
            style: const TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                fontSize: 28 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            'Summoner lvl: ' + widget.level!,
            style: const TextStyle(fontSize: 22 * 0.7, color: Colors.grey),
          ),
          widget.challenges!.preferences!.challengeIds!.length < 3
              ? const SizedBox(
                  height: 50 * 0.7,
                )
              : ChallengesCard(
                  challengeID1:
                      widget.challenges?.preferences?.challengeIds?[0],
                  challengeID2:
                      widget.challenges?.preferences?.challengeIds?[1],
                  challengeID3:
                      widget.challenges?.preferences?.challengeIds?[2],
                ),
          RankedCard("Ranked Solo", tier!.toLowerCase(), tier! + " " + rank!,
              leaguePoints.toString(), wins!, losses!),
          RankedCard(
            "Ranked Flex",
            tierFlex!.toLowerCase(),
            tierFlex! + " " + rankFlex!,
            leaguePointsFlex.toString(),
            winsFlex!,
            lossesFlex!,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Account Accolades',
                style: TextStyle(
                    fontSize: 22 * 0.7,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              AccoladesPage(
                matchHistoryTotals: widget.matchHistoryTotals,
                games: widget.matchHistoryTotals?.gamesPlayed,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Top Champion Masteries',
                style: TextStyle(
                    fontSize: 22 * 0.7,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ChampMasteryCard(
                championMasteryList: widget.championMasteryList,
              )
            ],
          ),
        ],
      ),
    );
  }
}
