import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key, required this.question, required this.title, required this.onTitlePressed,});
  final String question;
  final String title;
    final VoidCallback onTitlePressed; // Define onTitlePressed callback

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        text: 'Already have an account? ',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTitlePressed, // Add TapGestureRecognizer
          ),
        ],
      ),
    );
  }
}
