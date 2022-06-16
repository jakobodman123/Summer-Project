import 'package:flutter/material.dart';
import 'package:summer_project/apiMethods.dart';
import 'package:summer_project/mHCard.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchStats.dart';

class MatchHistoryWidget extends StatefulWidget {
  final List<MatchStats>? matchHistoryList;
  final String? summonerName;

  const MatchHistoryWidget({Key? key, this.matchHistoryList, this.summonerName})
      : super(key: key);
  @override
  MatchHistoryWidgetState createState() => MatchHistoryWidgetState();
}

class MatchHistoryWidgetState extends State<MatchHistoryWidget> {
  int itemCount = 10;
  @override
  void initState() {
    super.initState();
  }

  int findPersonUsingLoop(List<Participants>? people, String? summonerName) {
    if (people != null) {
      for (var i = 0; i < people.length; i++) {
        if (people[i].summonerName == summonerName) {
          // Found the person, stop the loop
          return i;
        }
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Column(
        children: [
          Container(
            width: 750,
            height: 1000,
            child: ListView.builder(
              //itemCount: widget.matchHistoryList!.length,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                int player = findPersonUsingLoop(
                    widget.matchHistoryList?[index].info?.participants,
                    widget.summonerName);
                return MHCard(
                  matchStats: widget.matchHistoryList?[index],
                  summonerName: widget.summonerName,
                  matchID: index,
                  matchHistoryList: widget.matchHistoryList,
                  player: widget
                      .matchHistoryList?[index].info?.participants?[player],
                );
              },
            ),
          ),
          Container(
            width: 750,
            child: InkWell(
              onTap: () {
                setState(() {
                  //extend matchHistory by 5
                  if (itemCount != 30) {
                    itemCount += 5;
                  }
                });
              },
              child: Card(
                elevation: 5,
                color:
                    itemCount == 30 ? Colors.red.withOpacity(0.3) : colorGrey,
                child: Text(
                  itemCount == 30
                      ? "Unable to Load more matches"
                      : "Load 5 more matches",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
