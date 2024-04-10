import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String note;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String tag;
  @HiveField(3)
  final String importance;
  @HiveField(4)
  final DateTime date;

  NoteModel(
      {required this.note,
      required this.name,
      required this.tag,
      required this.importance,
      required this.date});
}
