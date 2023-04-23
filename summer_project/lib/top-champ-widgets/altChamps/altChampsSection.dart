import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

import 'altChampsWidget.dart';

class AltchampSection extends StatelessWidget {
  final MatchHistoryTotals? mht2;
  final MatchHistoryTotals? mht3;
  final MatchHistoryTotals? mht4;

  final List<dynamic>? champsPlayedIds;

  const AltchampSection({
    Key? key,
    required this.mht2,
    required this.mht3,
    required this.mht4,
    required this.champsPlayedIds,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Alternative Champs",
          style: TextStyle(
            fontSize: 28 * 0.7,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2.0,
                color: Colors.blue,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 535 * 0.7,
          height: 1150 * 0.7,
          child: Column(
            children: [
              champsPlayedIds!.length < 2
                  ? const SizedBox()
                  : AltChampsWidget(champsPlayedIds![1], mht2!.gamesPlayed,
                      mht2!.winsTotal, mht2),
              champsPlayedIds!.length < 3
                  ? const SizedBox()
                  : AltChampsWidget(champsPlayedIds![2], mht3!.gamesPlayed,
                      mht3!.winsTotal, mht3),
              champsPlayedIds!.length < 4
                  ? const SizedBox()
                  : AltChampsWidget(champsPlayedIds![3], mht4!.gamesPlayed,
                      mht4!.winsTotal, mht4),
            ],
          ),
        ),
      ],
    );
  }
}
