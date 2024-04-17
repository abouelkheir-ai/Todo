part of 'remove_cubit.dart';

@immutable
sealed class RemoveState {}

final class RemoveInitial extends RemoveState {}

final class RemoveLoading extends RemoveState {}

final class RemoveSucess extends RemoveState {}

final class RemoveFaliure extends RemoveState {}
