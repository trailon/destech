import 'package:flutter/material.dart';

class Animations {
  static bottomAppBarAnimation({required Animation<double> parent}) {
    return CurvedAnimation(
      parent: parent,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
