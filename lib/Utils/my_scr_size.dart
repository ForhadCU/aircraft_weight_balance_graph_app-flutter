import 'package:flutter/cupertino.dart';

class MyScreenSize {
    static mGetHeight(
      {required BuildContext context, required double percentage}) {
    var h = (MediaQuery.of(context).size.height * percentage) / 100;

    return h;
  }

  static double mGetWidth(
      {required BuildContext context, required double percentage}) {
    var w = (MediaQuery.of(context).size.width * percentage) / 100;

    return w;
  }
}