import 'package:bmi_calculator/core/bloc/app_cubit.dart';
import 'package:bmi_calculator/core/bloc/app_states.dart';
import 'package:bmi_calculator/core/common/styles/themes.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_cubit.dart';
import 'package:bmi_calculator/src/bmi/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) => AppCubit()),
          BlocProvider<BMICubit>(create: (context) => BMICubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: ThemeMode.dark,
          home: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              if (state is AppChangeScreenState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppChangeScreenState.nextScreen,
                  ),
                );
              }
            },
            builder: (context, state) {
              return BlocProvider<BMICubit>(
                create: (context) => BMICubit(),
                child: const HomeScreen(),
              );
            },
          ),
        ));
  }
}
