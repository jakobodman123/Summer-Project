import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';

class BestChampionPicture extends StatelessWidget {
  final String champName;

  const BestChampionPicture(this.champName);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorGrey.withOpacity(0),
      shadowColor: Colors.blue,
      elevation: 20,
      child: SizedBox(
        height: 250 * 0.7,
        width: 450 * 0.7,
        child: Image(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/img/splash/${champName}_0.jpg"),
        ),
      ),
    );
  }
}
//"assets/img/splash/${champName}_0.jpg"