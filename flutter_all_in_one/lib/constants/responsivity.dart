import 'package:flutter/material.dart';

class MQ {
  static double ar(_) => MediaQuery.of(_).size.aspectRatio;
  static double w(_) => MediaQuery.of(_).size.width;
  static double h(_) => MediaQuery.of(_).size.height;
  static double ls(_) => MediaQuery.of(_).size.longestSide;
  static double ss(_) => MediaQuery.of(_).size.shortestSide;
}
