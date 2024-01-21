import 'package:flutter/material.dart';

Widget boxComponent({
  Widget? child,
  EdgeInsets? padding,
  Color? backgroundColor,
  double borderRadius = 0,
  List<BoxShadow>? boxShadow,
  double? width,
  double? height,
  DecorationImage? backgroundImage,
  double borderWidth = 0,
  Color borderColor = Colors.transparent,
}) =>
    Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        image: backgroundImage,
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: child,
    );
