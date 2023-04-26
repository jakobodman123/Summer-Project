import 'package:flutter/widgets.dart';

import '../../generated-classes/matchStats.dart';

class RuneSection extends StatelessWidget {
  final List<Styles>? styles;

  const RuneSection({Key? key, this.styles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children: [
          SizedBox(
            height: 40 * 0.7,
            width: 40 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                  "assets/runesImg/${styles?[0].selections?[0].perk}.png"),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 22 * 0.7,
                width: 22 * 0.7,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                      "assets/runesImg/${styles?[0].selections?[1].perk}.png"),
                ),
              ),
              SizedBox(
                height: 22 * 0.7,
                width: 22 * 0.7,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                      "assets/runesImg/${styles?[0].selections?[2].perk}.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22 * 0.7,
            width: 22 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                  "assets/runesImg/${styles?[0].selections?[3].perk}.png"),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 27 * 0.7,
            width: 27 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                  "assets/runesImg/${styles?[1].selections?[0].perk}.png"),
            ),
          ),
          SizedBox(
            height: 27 * 0.7,
            width: 27 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                  "assets/runesImg/${styles?[1].selections?[1].perk}.png"),
            ),
          ),
        ],
      ),
    ]);
  }
}
