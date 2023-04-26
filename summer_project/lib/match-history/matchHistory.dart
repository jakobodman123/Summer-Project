import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/match-history/mHCard.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MatchHistoryWidget extends StatefulWidget {
  final List<MatchStats>? matchHistoryList;
  final String? summonerName;
  final Function(List<MatchStats>?) onUpdate;
  final List<int>? playerIndexs;

  const MatchHistoryWidget({
    Key? key,
    this.matchHistoryList,
    this.summonerName,
    required this.onUpdate,
    this.playerIndexs,
  }) : super(key: key);
  @override
  MatchHistoryWidgetState createState() => MatchHistoryWidgetState();
}

class MatchHistoryWidgetState extends State<MatchHistoryWidget> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.matchHistoryList!.length; i++) {
      int? playerIndex = ApiMethods().findPersonUsingLoop(
          widget.matchHistoryList![i].info?.participants, widget.summonerName);
      widget.playerIndexs?.add(playerIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Column(
        children: [
          SizedBox(
            width: ResponsiveValue(
              context,
              defaultValue: 750 * 0.7,
              valueWhen: const [
                Condition.smallerThan(
                  name: TABLET,
                  value: 600 * 0.7,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: 750 * 0.7,
                )
              ],
            ).value,
            //width: 750 * 0.7,
            //height: 1075 * 0.7,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              /* 
              prototypeItem: MHCard(
                matchStats: widget.matchHistoryList?[0],
                summonerName: widget.summonerName,
                matchID: 0,
                matchHistoryList: widget.matchHistoryList,
                player: widget.matchHistoryList?[0].info
                    ?.participants?[widget.playerIndexs![0]],
                date: DateTime.fromMicrosecondsSinceEpoch(
                    widget.matchHistoryList![0].info!.gameEndTimestamp! * 1000),
              ),
              */
              itemCount: widget.matchHistoryList!.length,
              itemBuilder: (context, index) {
                int player = widget.playerIndexs![index];
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
            width: ResponsiveValue(
              context,
              defaultValue: 750 * 0.7,
              valueWhen: const [
                Condition.smallerThan(
                  name: TABLET,
                  value: 600 * 0.7,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: 750 * 0.7,
                )
              ],
            ).value,
            child: InkWell(
              onTap: () async {
                setState(() {
                  loading = true;
                });
                List<MatchStats>? matchHistory = await ApiMethods()
                    .getGameHistory(
                        summonerName: widget.summonerName,
                        start: widget.matchHistoryList?.length);
                widget.onUpdate(matchHistory);
                setState(() {
                  loading = false;
                });
              },
              child: SizedBox(
                  height: 50,
                  child: Card(
                      elevation: 5,
                      color: const Color(0xFF6082B6).withOpacity(0.3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loading == false
                              ? const Text(
                                  "Load More Matches",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : const SpinKitFadingCube(
                                  color: Colors.white,
                                  size: 25,
                                )
                        ],
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
