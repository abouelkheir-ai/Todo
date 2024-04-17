import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'firebase_auth_signin_state.dart';

class FirebaseAuthSigninCubit extends Cubit<FireBaseAuthSigninState> {
  FirebaseAuthSigninCubit() : super(FireBaseAuthSigninInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Emit a loading state
      print('Emitting SigninLoadingState');
      emit(SigninLoadingState());

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // If sign-in is successful, emit success state
      emit(SigninSucess());
    } catch (e) {
      // If an error occurs during sign-in, emit failure state
      emit(SigninFailure());
    }
  }
}
