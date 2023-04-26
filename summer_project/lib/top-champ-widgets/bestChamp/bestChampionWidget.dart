import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';

class BestChampionPicture extends StatelessWidget {
  final int champId;

  const BestChampionPicture(this.champId);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorGrey.withOpacity(0),
      shadowColor: Colors.black,
      elevation: 20,
      child: SizedBox(
        height: 250 * 0.7,
        width: 450 * 0.7,
        child: Image(
          fit: BoxFit.fitWidth,
          image: NetworkImage(
              "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-splashes/$champId/${champId}000.jpg"),
        ),
      ),
    );
  }
}
//"assets/img/splash/${champName}_0.jpg"