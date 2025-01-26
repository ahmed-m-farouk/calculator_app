import 'package:calculator/src/core/styles/size_app.dart';
import 'package:calculator/src/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: SizeApp.s14.h, horizontal: SizeApp.s14.w),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(SizeApp.s12.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: whiteBold24(),
        ),
      ),
    );
  }
}
