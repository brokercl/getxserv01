import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/entities/note.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id? id; // you can also use id = null to auto increment

// index se escribe sobre el campo que se desea indexar..
// en este caso  @Index va a ser efecto sobre email
  @Index(
    type: IndexType.value,
    unique: true,
  )
  String? email;

  String? password;

  @enumerated
  Rol role = Rol.student;

  final studentCourses = IsarLinks<Course>();
  final studentNotes = IsarLinks<Note>();
  final teacher = IsarLinks<Course>();

  @enumerated
  StatusUser status = StatusUser.pending;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    required this.status,
  });
}

// the order of enum Rol match the Image Rol in app bar of each widget
// dont change order of enum Rol
// add new Roles at bottom of enum Rol
// usercases roles
enum Rol {
  admin, // crud all except tutor pays
  manager, // crud over teachers and students
  tutor, // pay student courses
  teacher, // take courses as teacher to teach
  student, // take courses as student to learn
  commerce, // set course cost
  utp, // set schedule class
}

enum StatusUser {
  active,
  pending,
  deleted,
  suspended,
}
