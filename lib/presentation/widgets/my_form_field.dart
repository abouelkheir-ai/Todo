import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/presentation/widgets/sized_box.dart';

class MyFormFiled extends StatelessWidget {
  const MyFormFiled({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.obsecure,
    this.suffixIcon, this.validator,
  });
  final String title;
  final String hint;
  final bool? obsecure;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      title,
                      style: fontSize15withSemiBold,
                    )),
              ],
            ),
            verticalBox(
                4), // Adjust the height between the text and the input field
            TextFormField(
              obscureText: obsecure == null ? false : true,
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: hint,
                hintStyle: fontSize15withSemiBold.copyWith(
                    color: const Color(0xff000000).withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                suffixIcon: suffixIcon,
              ),
              validator: validator,
            ),
            verticalBox(20),
          ],
        ),
      ),
    );
  }
}
