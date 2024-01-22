import 'package:bmi_calculator/src/bmi/domain/entities/user_info_entity.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIStates> {
  BMICubit()
      : super(
          BMIInitialState(
            userInfoEntity: const UserInfoEntity(
                age: 21, height: 167.0, weight: 64.0, gender: 'unknown'),
          ),
        );

  static BMICubit get(context) => BlocProvider.of(context);

  // events
  void changeUserInfo({
    int? age,
    double? score,
    double? weight,
    double? height,
    String? gender,
  }) {
    emit(
      (UserInfoChangedState(
        userInfoEntity: state.userInfoEntity.copyWith(
          age: age,
          score: score,
          weight: weight,
          height: height,
          gender: gender,
        ),
      )),
    );
  }

  void calculateResult() {
    emit(
      BMICalculateResultState(
        userInfoEntity: state.userInfoEntity.copyWith(),
      ),
    );
  }
}
