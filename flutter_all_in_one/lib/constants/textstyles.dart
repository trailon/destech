import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/constants/responsivity.dart';

class TextStyles {
  static title(BuildContext context) => TextStyle(
        fontSize: MQ.ar(context) * 50,
        fontWeight: FontWeight.bold,
      );
  static subtitle(BuildContext context) => TextStyle(
        fontSize: MQ.ar(context) * 40,
        fontWeight: FontWeight.bold,
      );
  static info(BuildContext context) => TextStyle(
        fontSize: MQ.ar(context) * 30,
        fontWeight: FontWeight.w300,
      );
  static content(BuildContext context) => TextStyle(
        fontSize: MQ.ar(context) * 30,
        fontWeight: FontWeight.normal,
      );
  static custom(
          {required BuildContext context,
          double size = 30,
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
        fontSize: MQ.ar(context) * ((kIsWeb) ? size / 2 : size),
        fontWeight: weight,
      );
}
