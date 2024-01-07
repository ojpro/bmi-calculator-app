import 'package:bmi_calculator/shared/colors/main_palette.dart';
import 'package:flutter/material.dart';

Widget box({
  required Widget slot,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  Color? color,
  double radius = 8,
}) =>
    Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? MainPalette.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: slot,
    );
