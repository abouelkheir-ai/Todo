import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:today_todo/models/note.dart';

part 'remove_state.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit() : super(RemoveInitial());

  removeNote(String noteID) async {
    emit(RemoveLoading());
    try {
      var notesBox = Hive.box<Note>("notes");
      await notesBox.delete(noteID);
      emit(RemoveSucess());
    } catch (e) {
      emit(RemoveFaliure());
    }
  }
}
