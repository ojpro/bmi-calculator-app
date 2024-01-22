import 'package:bmi_calculator/src/bmi/domain/entities/user_info_entity.dart';

abstract class BMIStates {
  UserInfoEntity userInfoEntity;

  BMIStates({required this.userInfoEntity});
}

class BMIInitialState extends BMIStates {
  BMIInitialState({required super.userInfoEntity});
}

class UserInfoChangedState extends BMIStates {
  UserInfoChangedState({required super.userInfoEntity});
}

class BMICalculateResultState extends BMIStates {
  BMICalculateResultState({required super.userInfoEntity});
}
