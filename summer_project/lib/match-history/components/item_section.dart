import 'package:flutter/widgets.dart';
import 'package:summer_project/generated-classes/matchStats.dart';

import 'itemBox.dart';

class ItemSection extends StatelessWidget {
  final Participants? player;

  const ItemSection({Key? key, this.player}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ItemBox(itemID: player?.item0.toString()),
            ItemBox(itemID: player?.item1.toString()),
            ItemBox(itemID: player?.item2.toString()),
            Container(
              height: 35 * 0.7,
              width: 35 * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(
                      //3363 blue trink
                      "assets/img/item/${player?.item6.toString()}.png"))),
            ),
          ],
        ),
        Row(
          children: [
            ItemBox(itemID: player?.item3.toString()),
            ItemBox(itemID: player?.item4.toString()),
            ItemBox(itemID: player?.item5.toString()),
          ],
        ),
        //borde göra listor för de man spelat med
      ],
    );
  }
}
