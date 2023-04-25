import 'package:flutter/material.dart';

class SummonerSpells extends StatelessWidget {
  final int? summoner1Id;
  final int? summoner2Id;

  const SummonerSpells({Key? key, this.summoner1Id, this.summoner2Id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45 * 0.7,
          width: 45 * 0.7,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/img/spell/$summoner1Id.png"),
          ),
        ),
        SizedBox(
          height: 45 * 0.7,
          width: 45 * 0.7,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/img/spell/$summoner2Id.png"),
          ),
        ),
      ],
    );
  }
}
