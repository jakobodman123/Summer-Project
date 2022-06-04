import 'package:flutter/material.dart';
import 'package:summer_project/main.dart';

//https://pbs.twimg.com/media/B8jEndNIYAEavcH.jpg
class BestChampionPicture extends StatelessWidget {
  final String champName;

  const BestChampionPicture(this.champName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: colorGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadowColor: Colors.blue,
      elevation: 20,
      child: Container(
        height: 400,
        width: 500,
        child: Image(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/img/splash/${champName}_0.jpg"),
        ),
      ),
    );
  }
}
//"assets/img/splash/${champName}_0.jpg"