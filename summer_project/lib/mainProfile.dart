import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/accoladesPage.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'package:summer_project/rankedCard.dart';
import 'package:summer_project/searchPage.dart';

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
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Container(
        //width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 60,
              ), //4884
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80), // Image border
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        'assets/img/profileicon/${widget.iconID}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Image.asset(
                      'assets/rankedIcons/Position_Diamond-${widget.lane}.png'),
                ],
              ),

              //Image.asset('assets/img/profileicon/${iconID}.png'),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                widget.summonerName!,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                'Summoner lvl: ' + widget.level!,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: RankedCard("Ranked Solo", tier!, tier! + " " + rank!,
                    leaguePoints.toString(), wins!, losses!)),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: RankedCard(
                  "Ranked Flex",
                  tierFlex!,
                  tierFlex! + " " + rankFlex!,
                  leaguePointsFlex.toString(),
                  winsFlex!,
                  lossesFlex!,
                )),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                'Account Accolades',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  //top: 20,

                  ),
              child: AccoladesPage(
                matchHistoryTotals: widget.matchHistoryTotals,
                games: widget.matchHistoryTotals?.gamesPlayed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
