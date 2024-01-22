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
  List<Color>? gradientColors,
}) =>
    Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        image: backgroundImage,
        gradient: gradientColors == null
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              ),
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
