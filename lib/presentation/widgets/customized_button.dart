import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/constants/styles.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton(
      {super.key, required this.buttonTitle, required this.signOrSignUp});
  final String buttonTitle;
  final Function() signOrSignUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff62D2C3),
          borderRadius: BorderRadius.circular(5)),
      width: 335.w,
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: signOrSignUp,
        child: Center(
          child: Text(
            buttonTitle,
            style: fontSize20withBold,
          ),
        ),
      ),
    );
  }
}
