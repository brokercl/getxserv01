import 'package:gtxserv01/entities/course.dart';
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

  final student = IsarLinks<Course>();
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

enum Rol {
  // usercases roles
  admin, // crud all except tutor pays
  manager, // crud over teachers and students
  utp, // set schedule class
  tutor, // pay student courses
  commerce, // set course cost
  teacher, // take courses as teacher to teach
  student, // take courses as student to learn
}

enum StatusUser {
  active,
  pending,
  deleted,
  suspended,
}
