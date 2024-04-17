import 'package:flutter/material.dart';
import 'package:today_todo/constants/styles.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key, required this.title});
  final  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: fontSize22withBold,
    );
  }
}
