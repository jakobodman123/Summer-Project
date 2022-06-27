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
        height: 100.0,
        width: 100.0,
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
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      /*
      RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white, fontSize: 18),
          children: <TextSpan>[
            const TextSpan(
              text: "M: ",
            ),
            TextSpan(
                text: champMastery.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue)),
          ],
        ),
      )
      */
    ]);
  }
}
