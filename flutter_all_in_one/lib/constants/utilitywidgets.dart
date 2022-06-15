import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UtilityWidgets {
  static Widget textWithIcon(
      {required IconData icon,
      required String text,
      Color? iconcolor,
      TextStyle? style,
      int? maxLine}) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon,color: iconcolor,),
          AutoSizeText(text, style: style, maxLines: maxLine)
        ],
      ),
    );
  }
}
