import 'package:calculator/src/core/styles/size_app.dart';
import 'package:calculator/src/core/styles/strings_app.dart';
import 'package:calculator/src/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/calculator_state.dart';
import '../../cubit/calculator_cubit.dart';
import '../widgets/custom_calc_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          AppStrings.calculator,
          style: whiteBold24(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeApp.s20.h, horizontal: SizeApp.s20.w),
                  child: Text(
                    state.display,
                    style: bold36(),
                  ),
                );
              },
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            padding: EdgeInsets.all(16.w),
            children: [
              CalculatorButton(
                  label: "1",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("1")),
              CalculatorButton(
                  label: "2",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("2")),
              CalculatorButton(
                  label: "3",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("3")),
              CalculatorButton(
                  label: "+",
                  onTap: () =>
                      context.read<CalculatorCubit>().performOperation("+")),
              CalculatorButton(
                  label: "4",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("4")),
              CalculatorButton(
                  label: "5",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("5")),
              CalculatorButton(
                  label: "6",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("6")),
              CalculatorButton(
                  label: "-",
                  onTap: () =>
                      context.read<CalculatorCubit>().performOperation("-")),
              CalculatorButton(
                  label: "7",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("7")),
              CalculatorButton(
                  label: "8",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("8")),
              CalculatorButton(
                  label: "9",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("9")),
              CalculatorButton(
                  label: "*",
                  onTap: () =>
                      context.read<CalculatorCubit>().performOperation("*")),
              CalculatorButton(
                  label: "C",
                  onTap: () => context.read<CalculatorCubit>().clear()),
              CalculatorButton(
                  label: "0",
                  onTap: () =>
                      context.read<CalculatorCubit>().inputNumber("0")),
              CalculatorButton(
                  label: "/",
                  onTap: () =>
                      context.read<CalculatorCubit>().performOperation("/")),
              CalculatorButton(
                  label: "=",
                  onTap: () =>
                      context.read<CalculatorCubit>().calculateResult()),
            ],
          )
        ],
      ),
    );
  }
}
