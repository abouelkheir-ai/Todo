import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/add/todo_cubit.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/fetch/notes_cubit.dart';
import 'package:today_todo/bloc/cubit/todo/cubit/remove/remove_cubit.dart';

import 'package:today_todo/constants/strings.dart';
import 'package:today_todo/presentation/screens/first_screen.dart';
import 'package:today_todo/presentation/screens/login_screen.dart';
import 'package:today_todo/presentation/screens/register_screen.dart';
import 'package:today_todo/presentation/screens/todo_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    var info = settings.arguments;

    switch (settings.name) {
      case firstScreen:
        return MaterialPageRoute(builder: (ctx) => const FirstScreen());
      case registerScreen:
        return MaterialPageRoute(
          builder: (ctx) => RegisterScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(builder: (ctx) => const LoginScreen());
      case todoScreen:
        return MaterialPageRoute(
          builder: (ctx) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NotesCubit(),
              ),
              BlocProvider(
                create: (context) => TodoCubit(),
              ),
              BlocProvider(
                create: (context) => RemoveCubit(),
              ),
            ],
            child: TodoScreen(
              email: info.toString(),
            ),
          ),
        );
    }
    return null;
  }
}
