import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/constants/strings.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/presentation/widgets/customized_button.dart';
import 'package:today_todo/presentation/widgets/logo_header.dart';
import 'package:today_todo/presentation/widgets/my_title.dart';
import 'package:today_todo/presentation/widgets/sized_box.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  Widget mainBody(BuildContext context) {
    return Column(
      children: [
        const LogoHeader(),
        verticalBox(20),
        centerImage(),
        verticalBox(70),
        const MyTitle(
          title: 'Get things done with TODO',
        ),
        verticalBox(4),
        subTitle(),
        verticalBox(150),
        CustomizedButton(
          buttonTitle: 'Get Started',
          signOrSignUp: () {
            Navigator.pushNamed(context, registerScreen);
         
          },
        ),
      ],
    );
  }

  Widget centerImage() {
    return Center(child: Image.asset('assets/images/mobile.png'));
  }

  Widget subTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 66.w),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere gravida purus id eu condimentum est diam quam. Condimentum blandit diam.',
        style: fontSize15withSemiBold.copyWith(height: 1.6),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: mainBody(context)));
  }
}
