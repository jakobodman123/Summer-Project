import 'package:flutter/material.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/match-history/mHCard.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/generated-classes/matchStats.dart';

class MatchHistoryWidget extends StatefulWidget {
  final List<MatchStats>? matchHistoryList;
  final String? summonerName;
  final int? games;
  final List<int>? playerIndexes;

  const MatchHistoryWidget(
      {Key? key,
      this.matchHistoryList,
      this.summonerName,
      this.games,
      this.playerIndexes})
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
        if (people[i].summonerName?.toLowerCase() ==
            summonerName?.toLowerCase()) {
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
          SizedBox(
            width: 750 * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              //itemCount: widget.matchHistoryList!.length,
              itemCount: widget.matchHistoryList!.length <= 10
                  ? widget.matchHistoryList!.length
                  : itemCount,
              itemBuilder: (context, index) {
                /*
                int player = findPersonUsingLoop(
                    widget.matchHistoryList?[index].info?.participants,
                    widget.summonerName);
                    */
                int player = widget.playerIndexes![index];
                return MHCard(
                  matchStats: widget.matchHistoryList?[index],
                  summonerName: widget.summonerName,
                  matchID: index,
                  matchHistoryList: widget.matchHistoryList,
                  player: widget
                      .matchHistoryList?[index].info?.participants?[player],
                  date: DateTime.fromMicrosecondsSinceEpoch(
                      widget.matchHistoryList![index].info!.gameEndTimestamp! *
                          1000),
                );
              },
            ),
          ),
          SizedBox(
            width: 750 * 0.7,
            child: InkWell(
              onTap: () {
                setState(() {
                  //extend matchHistory by 5
                  if (itemCount != widget.matchHistoryList?.length) {
                    itemCount += 5;
                  }
                });
              },
              child: Card(
                elevation: 5,
                color: itemCount == widget.matchHistoryList?.length
                    ? Colors.red.withOpacity(0.3)
                    : colorGrey,
                child: Text(
                  itemCount == widget.matchHistoryList?.length
                      ? "Unable to Load more matches"
                      : "Load 5 more matches",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26 * 0.7,
                  ),
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
