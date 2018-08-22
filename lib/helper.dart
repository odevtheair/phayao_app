import 'package:flutter/material.dart';

class Helper {
  Helper();

  Color getColors(int score) {
    if (score == 5) return Colors.green[800];
    if (score == 4) return Colors.green[300];
    if (score == 3) return Colors.orange;
    if (score == 2) return Colors.deepOrange;
    if (score == 1) return Colors.pink;
    if (score == 0) return Colors.red[800];

    return Colors.blueGrey;
  }
}
