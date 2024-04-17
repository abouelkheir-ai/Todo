import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signUp(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Handle successful sign-up (navigate to another screen, show a success message, etc.)
    print('User signed up: ${userCredential.user!.uid}');
  } catch (error) {
    if (error is FirebaseAuthException) {
      if (error.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The email address is already in use by another account.'),
          ),
        );
      } else {
        // Handle other sign-up errors
        print('Failed to sign up: ${error.message}');
      }
    }
  }
}
