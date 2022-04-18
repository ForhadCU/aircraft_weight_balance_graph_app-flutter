import 'package:flutter/cupertino.dart';

class MyScreenSize {
    static double mGetHeight(
      {required BuildContext context, required double percentage}) {
    var h = (MediaQuery.of(context).size.height * percentage) / 100;

    return h;
  }

  static double mGetWidth(
      {required BuildContext context, required double percentage}) {
    double w = (MediaQuery.of(context).size.width * percentage) / 100;

    return w;
  }
}