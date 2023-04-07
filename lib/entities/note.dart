import 'package:gtxserv01/entities/user.dart';
import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  Id? id; // you can also use id = null to auto increment

  int? note;

  @Backlink(to: 'studentNotes')
  final studentNotes = IsarLink<User>();

  Note(this.id, this.note);
}
