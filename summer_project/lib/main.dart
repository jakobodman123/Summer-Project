import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:summer_project/searchPage.dart';

import 'about_page.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
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
      initialRoute: '/',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SearchPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
