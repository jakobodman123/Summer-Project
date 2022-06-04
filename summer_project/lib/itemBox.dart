import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  final String? itemID;
  bool noIdItem = true;

  ItemBox({Key? key, required this.itemID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (itemID == "0") {
      noIdItem = false;
    }
    // TODO: implement build
    return Container(
      height: 35,
      width: 35,
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
