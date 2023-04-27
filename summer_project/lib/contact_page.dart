import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/contact_card.dart';
import 'package:summer_project/util/contact_profile.dart';
import 'package:summer_project/util/custom_appbar.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().customAppbar(context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 100,
                      ),
                      child: SizedBox(
                        width: 450,
                        child: Text(
                          "Get In Touch With The Friendly Developer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 450,
                      child: Text(
                        "I will try to answer all questions to the best of my ability!",
                        textAlign: TextAlign.center,
                        style: TextStyle(shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ], fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ResponsiveRowColumn(
                      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      layout:
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      children: const [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: ContactCard(
                            title: "Instagram ",
                            description:
                                "Might not be all about websites and development but hey ;)",
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            url:
                                'https://github.com/jakobodman123/Summer-Project',
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: ContactCard(
                            title: "Email ",
                            description:
                                "For questions about the app, business questions email me here.",
                            icon: FaIcon(FontAwesomeIcons.envelopesBulk),
                            url:
                                'https://github.com/jakobodman123/Summer-Project',
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: ContactCard(
                            title: "Github ",
                            description:
                                "For feature proposals, bugs, unintended behavior, or push requests.",
                            icon: FaIcon(FontAwesomeIcons.github),
                            url:
                                'https://github.com/jakobodman123/Summer-Project',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ContactProfile(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
