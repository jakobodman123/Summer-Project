import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/accoladesPage.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'package:summer_project/rankedCard.dart';

//https://pbs.twimg.com/media/B8jEndNIYAEavcH.jpg

class MainProfile extends StatefulWidget {
  const MainProfile(this.iconID, this.level, this.summonerName, this.summonerID,
      this.soloQRank, this.flexQRank, this.matchHistoryTotals, this.lane);

  final String? iconID; //"4884"
  final String? level;
  final String? summonerName;
  final String? summonerID;
  final Rank? soloQRank;
  final Rank? flexQRank;
  final MatchHistoryTotals? matchHistoryTotals;
  final String? lane;

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
    //setPlayerRankedInfo();

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
    // TODO: implement build

    return Card(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
              bottomRight: Radius.circular(150)),
        ),
        color: colorLightGrey,
        elevation: 10,
        child: SizedBox(
          height: 1250,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                ), //4884
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80), // Image border
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset(
                          'assets/img/profileicon/${widget.iconID}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                          'assets/rankedIcons/Position_Diamond-${widget.lane}.png'),
                    ),
                  ],
                ),

                //Image.asset('assets/img/profileicon/${iconID}.png'),
              ),
              Text(
                widget.summonerName!,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Summoner lvl: ' + widget.level!,
                style: const TextStyle(fontSize: 22, color: Colors.grey),
              ),
              RankedCard("Ranked Solo", tier!, tier! + " " + rank!,
                  leaguePoints.toString(), wins!, losses!),
              RankedCard(
                "Ranked Flex",
                tierFlex!,
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
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  AccoladesPage(
                    matchHistoryTotals: widget.matchHistoryTotals,
                    games: widget.matchHistoryTotals?.gamesPlayed,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
