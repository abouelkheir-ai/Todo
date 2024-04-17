part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class FetchNotesState extends NotesState {}
class FetchNotesLoading extends NotesState {}
class FetchNotesFailure extends NotesState {}
