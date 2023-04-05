import 'package:gtxserv01/entities/payments.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:isar/isar.dart';

part 'course.g.dart';

@collection
class Course {
  Id? id; // you can also use id = null to auto increment

  @enumerated
  TopicCourse topic = TopicCourse.programming;

  @enumerated
  StatusCourse status = StatusCourse.pending;

  @Backlink(to: 'student')
  final student = IsarLink<User>();

  @Backlink(to: 'teacher')
  final teacher = IsarLink<User>();

  @Backlink(to: 'courseId')
  final courseId = IsarLink<Payments>();

  @enumerated
  final ModalClass modalClass;

  @enumerated
  ScheduleClass scheduleClass;

  int coursecost;
  int numCuotas;
  Course({
    required this.id,
    required this.topic,
    required this.status,
    required this.modalClass,
    required this.coursecost,
    required this.numCuotas,
    required this.scheduleClass,
  });
}

enum ScheduleClass { day, afternoon, evening }

enum ModalClass {
  presencial,
  eClass,
  mixClass,
}

enum TopicCourse {
  science,
  math,
  history,
  literature,
  programming,
}

enum StatusCourse {
  active,
  pending,
  deleted,
  suspended,
}
