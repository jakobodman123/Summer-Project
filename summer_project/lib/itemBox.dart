import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  final String? itemID;
  final double? size;
  bool noIdItem = true;

  ItemBox({Key? key, required this.itemID, this.size = 35}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (itemID == "0") {
      noIdItem = false;
    }
    // TODO: implement build
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.brown,
          width: 1,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: noIdItem
            //lägg till asset med id 0
            ? Image.asset("assets/img/item/${itemID}.png")
            : Container(
                color: Colors.grey,
              ),
      ),
    );
  }
}
