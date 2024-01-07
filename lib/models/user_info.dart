class UserInfo{
  static int age = 21;
  static int weight = 64;
  static double height = 165.0;
  static bool isMale = true;

  static double calculateBMIScore() {
    double heightInMeter = height / 100;
    return weight /(heightInMeter * heightInMeter);
  }
}