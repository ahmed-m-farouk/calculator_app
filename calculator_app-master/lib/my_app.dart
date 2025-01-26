import 'package:calculator/src/features/calculator/cubit/calculator_cubit.dart';
import 'package:calculator/src/features/calculator/view/screen/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocProvider(
              create: (context) => CalculatorCubit(),
              child: CalculatorScreen(),
            ),
          );
        });
  }
}
