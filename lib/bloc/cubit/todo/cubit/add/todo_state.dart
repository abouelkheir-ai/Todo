part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

final class TodoAddingSucess extends TodoState {
  
}

class AddNoteFailure extends TodoState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}