part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucess extends SignupState {}

class SignupFailure extends SignupState {
  String error;
  SignupFailure(this.error);
}
