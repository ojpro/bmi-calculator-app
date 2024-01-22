import 'package:bmi_calculator/src/bmi/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

abstract class AppStates {}

class AppInitState extends AppStates {}

class AppChangeScreenState extends AppStates {
  static Widget nextScreen = const HomeScreen();

  AppChangeScreenState(Widget screen) {
    nextScreen = screen;
  }
}
