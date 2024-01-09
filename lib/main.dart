import 'package:bmi_calculator/modules/home.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget{
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}