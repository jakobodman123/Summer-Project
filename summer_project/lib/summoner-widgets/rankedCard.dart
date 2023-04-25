import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';

class RankedCard extends StatelessWidget {
  final String rankedType;
  final String rankedBorder;
  final String rank;
  final String lp;
  final int wins;
  final int losses;

  const RankedCard(this.rankedType, this.rankedBorder, this.rank, this.lp,
      this.wins, this.losses,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: colorGrey,
      child: ClipPath(
        child: Container(
          height: 105 * 0.7,
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      color: Colors.blue.withOpacity(0.5), width: 5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " " + rankedType,
                style: const TextStyle(
                    fontSize: 18 * 0.7,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Divider(
                //height: 20,
                thickness: 3,
                //indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10 * 0.7,
                      ),
                      child: SizedBox(
                        width: 50.0 * 0.7,
                        height: 50.0 * 0.7,
                        child: Image.network(
                          "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/assets/loadouts/summoneremotes/rewards/ranked/2019/split1/em_2019_1_$rankedBorder\_inventory.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rank,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          lp + "LP",
                          style: TextStyle(
                              fontSize: 17 * 0.7,
                              color: Colors.white.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wins.toString() + "W " + losses.toString() + "L",
                        style: TextStyle(
                            fontSize: 17 * 0.7,
                            color: Colors.white.withOpacity(0.6)),
                      ),
                      Text(
                        "Winrate: " +
                            ((wins / (wins + losses)) * 100)
                                .toStringAsFixed(1) +
                            "%",
                        style: TextStyle(
                            fontSize: 17 * 0.7,
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        clipper: ShapeBorderClipper(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      ),
    );
  }
}
