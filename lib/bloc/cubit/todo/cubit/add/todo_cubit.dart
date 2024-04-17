import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import 'package:today_todo/models/note.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  addNote(Note note) async {
    emit(TodoLoading());
    try {
      var notesBox = Hive.box<Note>("notes");
      await notesBox.put(note.task, note);
      emit(TodoAddingSucess());

      // Fetch all notes after adding a new note
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
