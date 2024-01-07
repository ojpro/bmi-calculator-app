class InterpretationType {
  static String value = '';
  static String note = '';
  static int color = 0xFFFFFFFF;

  static void interpret(score) {
    switch (score) {
      case < 18.5:
        value = 'Underweight';
        note =
            'You are underweight. 🍏 Consider consulting with a nutritionist.';
        color = 0xFFfb8500;
      case >= 18.5 && <= 24.9:
        value = 'Normal Weight';
        note = 'You have a normal body weight. Great job! 🎉';
        color = 0xFF16db65;
      case >= 25.0 && <= 29.9:
        value = 'OverWeight';
        note =
            'You are overweight. 💪 Consider adopting a healthier lifestyle.';
        color = 0xFF9b5de5;
      case >= 30.0:
        value = 'Obesity';
        note =
            'You are in the obesity range. Try to focus on a healthier lifestyle. Consult with a healthcare professional. 👨‍⚕️';
        color = 0xFFd62246;
      default:
        value = 'Unknown';
        note = 'BMI calculation result is unknown. 🤷‍♂️';
        color = 0xFF8d99ae;
    }
  }
}
