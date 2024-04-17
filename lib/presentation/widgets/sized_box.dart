import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalBox(int height) {
  return SizedBox(
    height: height.h,
  );
  
}
SizedBox horizontalBox(int width) {
  return SizedBox(
    height: width.w,
  );
  
}