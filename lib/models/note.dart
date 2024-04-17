import 'package:hive_flutter/hive_flutter.dart';

part 'note.g.dart'; // Part directive for code generation

@HiveType(typeId: 0) // Annotation for Hive
class Note extends HiveObject {
  @HiveField(0) // Annotation for Hive
  String userId;

  @HiveField(1) // Annotation for Hive
  String task;

  @HiveField(2) // Annotation for Hive
  bool finished;

  Note({
    required this.userId,
    required this.task,
    required this.finished,
  });
}
