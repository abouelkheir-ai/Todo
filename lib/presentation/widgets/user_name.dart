import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:today_todo/constants/styles.dart';

class UserName extends StatefulWidget {
  final String email;
  const UserName({Key? key, required this.email}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  late Future<String> _nameFuture;

  @override
  void initState() {
    super.initState();
    _nameFuture = fetchData();
  }

  Future<String> fetchData() async {
    final email = widget.email;
    final box = await Hive.openBox("Info");
    final name = box.get(email) ?? ""; // Handle null value
    print(name);
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _nameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'Loading...',
            style: fontSize22withBold.copyWith(color: Colors.white),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: fontSize22withBold.copyWith(color: Colors.white),
          );
        } else {
          final name = snapshot.data ?? ""; // Handle null value
          return Text(
            name,
            style: fontSize22withBold.copyWith(color: Colors.white),
          );
        }
      },
    );
  }
}
