import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/fetch/notes_cubit.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/remove/remove_cubit.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/models/note.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              checked = true;
              BlocProvider.of<RemoveCubit>(context)
                  .removeNote(widget.note.task);
              BlocProvider.of<NotesCubit>(context)
                  .fetchNotes(widget.note.userId);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 17.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: checked
                    ? const Color(0xff56C5B6)
                    : const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.black, width: 1),
              ),
            ),
          ),
          Text(
            widget.note.task,
            style: fontSize15withSemiBold.copyWith(
                fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
