import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/src/app.dart';
import 'package:flutter/material.dart';

import 'core/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  return runApp(const BMIApp());
}
