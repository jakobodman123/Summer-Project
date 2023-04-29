import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/main.dart';

class MasteryCard extends StatelessWidget {
  final int mastery;

  const MasteryCard(this.mastery, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500 * 0.7,
      child: Card(
        color: colorGrey,
        shadowColor: Colors.blue,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100.0 * 0.7,
              height: 100.0 * 0.7,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    "assets/rankedIcons/masteryIcon.png",
                  )),
            ),
            const Text(
              ' Mastery Points: ',
              style: TextStyle(
                  fontSize: 28 * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            GlowText(
              mastery.toString(),
              style: const TextStyle(
                fontSize: 28 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
