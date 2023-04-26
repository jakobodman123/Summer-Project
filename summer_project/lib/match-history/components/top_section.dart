import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../helpClasses/supportMethods.dart';
import '../../util/match_date.dart';

class TopSection extends StatelessWidget {
  final bool? win;
  bool? isExpanded;
  final Function(bool) onValueChanged;
  final int? queueId;
  final int? gameDuration;
  final DateTime date;

  TopSection(
      {Key? key,
      required this.win,
      required this.queueId,
      required this.gameDuration,
      required this.date,
      required this.onValueChanged,
      this.isExpanded})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              queueId != null
                  ? "  " + SupportMethods().getGameTypeFromID(queueId) + "  "
                  : "Game",
              style: TextStyle(
                shadows: const [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                fontSize: 20 * 0.7,
                fontWeight: FontWeight.bold,
                color: win!
                    ? const Color(0xFF6082B6).withOpacity(0.8)
                    : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.8),
              ),
            ),
            Text(
              (gameDuration! / 60).toStringAsFixed(0) + "min",
              style: TextStyle(
                  fontSize: 16 * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
        Row(
          children: [
            MatchDate(date: date),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 1),
              child: InkWell(
                onTap: () {
                  isExpanded = !isExpanded!;
                  onValueChanged(isExpanded!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: win!
                        ? const Color(0xFF6082B6).withOpacity(0.5)
                        : const Color.fromRGBO(255, 82, 82, 1).withOpacity(0.5),
                  ),
                  height: 17,
                  width: 17,
                  child: !isExpanded!
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          size: 17,
                          color: win!
                              ? const Color(0xFF6082B6)
                              : const Color.fromRGBO(255, 82, 82, 1),
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                          size: 17,
                          color: win!
                              ? const Color(0xFF6082B6)
                              : const Color.fromRGBO(255, 82, 82, 1)
                                  .withOpacity(0.8),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
