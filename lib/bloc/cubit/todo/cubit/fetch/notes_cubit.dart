import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:today_todo/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<Note>? notes;
  fetchNotes(String userId) {
    var notesBox = Hive.box<Note>("notes");
    notes = notesBox.values.where((note) => note.userId == userId).toList();

    emit(FetchNotesState());
  }
}
