import 'package:flutter/material.dart';

class AppPadding {
  static const Padding primaryPadding = Padding(padding: EdgeInsets.all(20.0));
  static const Padding secondaryPadding = Padding(
    padding: EdgeInsets.only(top: 20.0, bottom: 0, left: 20, right: 20),
  );
  static const Padding buttonPadding = Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  );

  static EdgeInsets bottomNavBarPadding = const EdgeInsets.only(
    top: 0,
    bottom: 20,
    left: 15,
    right: 15,
  );

  static EdgeInsets bottomNavBarPadding2 = const EdgeInsets.only(
    bottom: 10,
    top: 10,
    left: 25,
    right: 25,
  );
}
