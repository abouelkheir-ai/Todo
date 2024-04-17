import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:today_todo/bloc/cubit/signup/signup_cubit.dart';
import 'package:today_todo/constants/strings.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/presentation/widgets/already_have_account.dart';
import 'package:today_todo/presentation/widgets/customized_button.dart';
import 'package:today_todo/presentation/widgets/logo_header.dart';
import 'package:today_todo/presentation/widgets/my_form_field.dart';
import 'package:today_todo/presentation/widgets/my_title.dart';
import 'package:today_todo/presentation/widgets/sized_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget subTitle() {
    return Text(
      'Lets help you in completing your tasks',
      style: fontSize15withSemiBold,
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _savePersonalInfo() async {
    var box = await Hive.openBox("Info");
    await box.put(_emailController.text, _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSucess) {
              _savePersonalInfo();
              Navigator.pushNamed(context, todoScreen,
                  arguments: _emailController.text);
            } else if (state is SignupFailure) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Sign Up Failed'),
                    content: Text(state.error),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
            print('New State: $state');
          },
          builder: (context, state) {
            final authCubit = BlocProvider.of<SignupCubit>(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  const LogoHeader(),
                  Column(
                    children: [
                      verticalBox(30),
                      const MyTitle(title: 'Welcome Onboard!'),
                      subTitle(),
                      verticalBox(40),
                      MyFormFiled(
                        title: 'Full Name',
                        hint: 'Mary Elliot',
                        controller: _nameController,
                        validator: validateName,
                      ),
                      MyFormFiled(
                        controller: _emailController,
                        title: 'Email',
                        hint: 'mary.elliot@mail.com',
                        validator: validateEmail,
                      ),
                      MyFormFiled(
                        controller: _passwordController,
                        title: 'Password',
                        hint: '**************',
                        obsecure: true,
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        validator: validatePassword,
                      ),
                      MyFormFiled(
                        title: 'Confirm Password',
                        hint: '**************',
                        controller: _confirmPasswordController,
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        obsecure: true,
                        validator: (value) => validateConfirmPassword(
                            value, _passwordController.text),
                      ),
                      verticalBox(60),
                      CustomizedButton(
                        buttonTitle: 'Register',
                        signOrSignUp: () {
                          String email = _emailController.text;
                          String pass = _passwordController.text;
                          authCubit.signUpWithEmailAndPassword(
                            context,
                            email,
                            pass,
                          );
                        },
                      ),
                      if (state is SignupLoading)
                        const CircularProgressIndicator(), // Show loading indicator
                    ],
                  ),
                  verticalBox(10),
                  AlreadyHaveAccount(
                    question: 'Already have an account ?',
                    title: 'Sign In',
                    onTitlePressed: () {
                      Navigator.pushNamed(context, loginScreen);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
