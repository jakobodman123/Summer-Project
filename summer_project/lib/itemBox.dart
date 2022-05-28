import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  final String itemID;

  const ItemBox({Key? key, required this.itemID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 35,
      width: 35,
      child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset("assets/img/item/${itemID}.png")),
    );
  }
}
