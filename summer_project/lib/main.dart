import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:summer_project/pages/contact_page.dart';
import 'package:summer_project/pages/homePage.dart';
import 'package:summer_project/pages/searchPage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/about_page.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.7);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

void main() {
  runApp(const SummerProject());
}

class SummerProject extends StatelessWidget {
  const SummerProject();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      initialRoute: '/',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/summoner/')) {
          return MaterialPageRoute(
            builder: (context) =>
                TestPage(summonerName: settings.name!.substring(10)),
            settings: settings,
          );
        }

        return null;
      },
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SearchPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/summoner': (context) => TestPage(
              summonerName: "",
            ),
      },
    );
  }
}
