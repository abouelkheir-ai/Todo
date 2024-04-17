import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/bloc/cubit/signin/firebase_auth_signin_cubit.dart';
import 'package:today_todo/constants/strings.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/presentation/widgets/already_have_account.dart';
import 'package:today_todo/presentation/widgets/customized_button.dart';
import 'package:today_todo/presentation/widgets/logo_header.dart';
import 'package:today_todo/presentation/widgets/my_form_field.dart';
import 'package:today_todo/presentation/widgets/my_title.dart';
import 'package:today_todo/presentation/widgets/sized_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FirebaseAuthSigninCubit(),
        child: BlocConsumer<FirebaseAuthSigninCubit, FireBaseAuthSigninState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is SigninSucess) {
              // print(_emailController.text);
              Navigator.pushNamed(
                context,
                todoScreen,
                arguments: _emailController.text.toString(),
              );
            }
            print(state);
          },
          builder: (context, state) {
            final authCubit = BlocProvider.of<FirebaseAuthSigninCubit>(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  const LogoHeader(),
                  const MyTitle(title: 'Welcome Back!'),
                  Image.asset(
                    'assets/images/mobile2.png',
                    width: 180.w,
                    height: 180.h,
                  ),
                  MyFormFiled(
                      controller: _emailController,
                      title: 'Email',
                      hint: 'mary.elliot@mail.com'),
                  MyFormFiled(
                      controller: _passwordController,
                      title: 'Password',
                      hint: '**************'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          'Forgot Password?',
                          style: fontSize15withSemiBold.copyWith(
                              color: const Color(
                                0xff62D2C3,
                              ),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  verticalBox(130),
                  CustomizedButton(
                    buttonTitle: 'Login',
                    signOrSignUp: () {
                      String email = _emailController.text;
                      String pass = _passwordController.text;
                      authCubit.signInWithEmailAndPassword(email, pass);
                    },
                  ),
                  verticalBox(10),
                  AlreadyHaveAccount(
                    question: 'Don’t have an account ?',
                    title: 'Sign Up',
                    onTitlePressed: () {
                      Navigator.pop(context, registerScreen);
                    },
                  ),
                  if (state is SigninLoadingState)
                    const CircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
