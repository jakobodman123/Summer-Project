import 'package:flutter/material.dart';

class ChampMasteryIcon extends StatelessWidget {
  final String? champName;
  final int? champMastery;
  const ChampMasteryIcon({Key? key, this.champName, this.champMastery})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
        height: 100.0 * 0.7,
        width: 100.0 * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.brown,
            width: 1,
          ),
        ),
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/img/champion/$champName.png")),
      ),
      Text(
        "M: " + champMastery.toString(),
        style: const TextStyle(
            fontSize: 18 * 0.7,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ]);
  }
}
