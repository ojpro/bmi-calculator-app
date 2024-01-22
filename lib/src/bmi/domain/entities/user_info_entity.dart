import 'package:bmi_calculator/src/bmi/domain/entities/result_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'result_theme_entity.dart';

class UserInfoEntity extends Equatable {
  final int age;
  final String? id;
  final bool? hasStar;
  final double? score;
  final double weight;
  final double height;
  final String? gender;
  final int? createdAt;
  final int? updatedAt;
  final int? deletedAt;
  final List<ResultThemeEntity?>? resultTheme;

  const UserInfoEntity({
    this.id,
    this.hasStar,
    this.score,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.resultTheme,
    required this.age,
    required this.weight,
    required this.height,
  });

  @override
  List<Object?> get props => <Object?>[
        age,
        id,
        hasStar,
        score,
        weight,
        height,
        gender,
        createdAt,
        updatedAt,
        deletedAt,
      ];

  UserInfoEntity copyWith({
    int? age,
    String? id,
    bool? hasStar,
    double? score,
    double? weight,
    double? height,
    String? gender,
    int? createdAt,
    int? updatedAt,
    int? deletedAt,
    List<ResultThemeEntity?>? resultTheme,
  }) {
    return UserInfoEntity(
      id: id ?? this.id,
      age: age ?? this.age,
      score: score ?? this.score,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      hasStar: hasStar ?? this.hasStar,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      resultTheme: resultTheme ?? this.resultTheme,
    );
  }

  double calculateBMIScore() {
    double heightInMeter = height / 100;
    return weight / (heightInMeter * heightInMeter);
  }

  ResultEntity getInterpretation() {
    final score = calculateBMIScore();
    switch (score) {
      case < 18.5:
        return ResultEntity(
          message: 'Underweight',
          note:
              'You are underweight. 🍏 Consider consulting with a nutritionist.',
          score: score,
          resultGradient: ResultThemeEntity(
            startColor: const Color(0xFFfb8500),
            endColor: const Color(0xFF99c606),
          ),
        );
      case >= 18.5 && <= 24.9:
        return ResultEntity(
          message: 'Normal Weight',
          note: 'You have a normal body weight. Great job! 🎉',
          score: score,
          resultGradient: ResultThemeEntity(
            startColor: const Color(0xFF16db65),
            endColor: const Color(0xFF34b980),
          ),
        );
      case >= 25.0 && <= 29.9:
        return ResultEntity(
          message: 'OverWeight',
          note:
              'You are overweight. 💪 Consider adopting a healthier lifestyle.',
          score: score,
          resultGradient: ResultThemeEntity(
            startColor: const Color(0xFF9b5de5),
            endColor: const Color(0xFFd091c7),
          ),
        );
      case >= 30.0:
        return ResultEntity(
          message: 'Obesity',
          note:
              'You are in the obesity range. Try to focus on a healthier lifestyle. Consult with a healthcare professional. 👨‍⚕️',
          score: score,
          resultGradient: ResultThemeEntity(
            startColor: const Color(0xFFd62246),
            endColor: const Color(0xFFdba53e),
          ),
        );
      default:
        return ResultEntity(
          message: 'Unknown',
          note: 'BMI calculation result is unknown. 🤷‍♂️',
          score: score,
          resultGradient: ResultThemeEntity(
            startColor: const Color(0xFF8d99ae),
            endColor: const Color(0xFF3d3846),
          ),
        );
    }
  }

  ResultEntity getDefaultResult() =>  ResultEntity(
    message: 'Unknown',
    note: 'BMI calculation result is unknown. 🤷‍♂️',
    score: 0,
    resultGradient: ResultThemeEntity(
      startColor: const Color(0xFF8d99ae),
      endColor: const Color(0xFF3d3846),
    ),
  );

}
