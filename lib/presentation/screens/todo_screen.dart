// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/add/todo_cubit.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/fetch/notes_cubit.dart';
import 'package:today_todo/constants/styles.dart';
import 'package:today_todo/models/note.dart';
import 'package:today_todo/presentation/widgets/list_view.dart';
import 'package:today_todo/presentation/widgets/logo_header.dart';
import 'package:today_todo/presentation/widgets/sized_box.dart';
import 'package:today_todo/presentation/widgets/user_name.dart';

class TodoScreen extends StatefulWidget {
  final String? email;
  const TodoScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String? name;
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes(widget.email ?? "");
    print(widget.email);
    super.initState();
  }

  void _fetchesNotes() {
    final fetchNoteCubit = BlocProvider.of<NotesCubit>(context);
    fetchNoteCubit.fetchNotes(widget.email ?? "");
  }

  void _addNotes(String note) {
    final addNoteCubit = BlocProvider.of<TodoCubit>(context);
    addNoteCubit
        .addNote(Note(task: note, finished: false, userId: widget.email!));
    _fetchesNotes();
    Navigator.of(context).pop();
  }

  void _showAlertDialog(String note) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Note'),
          content: TextField(
            onChanged: (value) {
              note = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("cancel"),
            ),
            TextButton(
              onPressed: () {
                _addNotes(note);
              },
              child: const Text('Add'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String note = "";
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              width: 375.w,
              height: 292.h,
              color: const Color(0xff62D2C3).withOpacity(1),
            ),
            const LogoHeader(),
            SizedBox(
              child: Column(
                children: [
                  verticalBox(100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/avatar.png'),
                    ],
                  ),
                  verticalBox(20),
                  UserName(
                    email: widget.email ?? "",
                  )
                ],
              ),
            ),
          ],
        ),
        verticalBox(20),
        Image.asset('assets/images/clock.png'),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Task List',
                style: fontSize22withBold,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Tasks',
                        style: fontSize15withSemiBold,
                      ),
                      IconButton(
                        onPressed: () {
                          _showAlertDialog(note);
                        },
                        icon: const Icon(Icons.add_circle_sharp),
                        color: const Color(0xff56C5B6),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  MyListView()
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
