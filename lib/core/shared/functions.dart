import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SharedFunctions {
  static void doNavigation(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  static void doReplacementNavigation(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
}
