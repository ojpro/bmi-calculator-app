import 'package:flutter/material.dart';

Widget defaultText({
  required String text,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 16.0,
  TextAlign textAlign = TextAlign.start,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
