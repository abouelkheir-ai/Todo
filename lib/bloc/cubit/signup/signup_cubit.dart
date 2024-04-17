import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      // Emit a loading state
      emit((SignupLoading()));

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed up: ${userCredential.user!.uid}');

      // If sign-in is successful, emit success state
      emit(SignupSucess());
    } catch (error) {
      String errorMessage = error.toString();
      if (error is FirebaseAuthException) {
        if (error.code == 'email-already-in-use') {
          errorMessage =
              'The email address is already in use by another account.';
        } else {
          // Handle other sign-up errors
          errorMessage = 'Failed to sign up: ${error.message}';
        }
      }
      // If an error occurs during sign-in, emit failure state
      emit(SignupFailure(errorMessage));
    }
  }
}
