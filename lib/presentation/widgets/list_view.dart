import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/fetch/notes_cubit.dart';
import 'package:today_todo/models/note.dart';
import 'package:today_todo/presentation/widgets/todo_list_item.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        final fetchNoteCubit = BlocProvider.of<NotesCubit>(context);
        List<Note> notes = fetchNoteCubit.notes ?? [];
        if (state is FetchNotesLoading) {
          return const CircularProgressIndicator();
        }
        if (state is FetchNotesFailure) {
          return Text("FetchNotesFailed");
        }
        print(state);
        print(2);
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(
                note: notes[index],
              );
            },
          ),
        );
      },
    );
  }
}
