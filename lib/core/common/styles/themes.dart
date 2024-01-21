import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme({
  Color scaffoldBackgroundColor = Colors.white,
  Color appBarBackground = Colors.white,
  Color appBarTitleColor = Colors.black,
}) =>
    ThemeData(
      switchTheme: SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.blueAccent;
        }),
        trackColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.blueAccent;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        overlayColor: MaterialStateProperty.all(
          Colors.blueAccent,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          Colors.blueAccent,
        ),
        splashRadius: 20,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        titleTextStyle: TextStyle(
          color: appBarTitleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20.0,
        backgroundColor: Color(0xFFFCFCFC),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.black54,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsPalette.buttonBackground,
      ),
    );

ThemeData darkTheme({
  Color scaffoldBackgroundColor = Colors.black,
  Color appBarBackground = Colors.black,
  Color appBarTitleColor = Colors.white,
}) =>
    ThemeData(
      switchTheme: SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.blueAccent;
        }),
        trackColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.blueAccent;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        overlayColor: MaterialStateProperty.all(
          Colors.blueAccent,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          Colors.blueAccent,
        ),
        splashRadius: 20,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: ColorsPalette.textColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsPalette.primary,
        titleTextStyle: TextStyle(
          color: appBarTitleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.grey.shade200,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade200,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
      scaffoldBackgroundColor: ColorsPalette.secondary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20.0,
        backgroundColor: const Color(0xFF101010),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.grey.shade500,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsPalette.buttonBackground,
      ),
    );
