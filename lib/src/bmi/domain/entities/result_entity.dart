import 'package:bmi_calculator/src/bmi/domain/entities/result_theme_entity.dart';

class ResultEntity {
  final double score;
  final String message;
  final String note;
  final ResultThemeEntity resultGradient;

  ResultEntity({
    required this.score,
    required this.message,
    required this.note,
    required this.resultGradient,
  });
}
