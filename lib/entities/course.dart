import 'package:gtxserv01/entities/payment.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:isar/isar.dart';

part 'course.g.dart';

@collection
class Course {
  Id? id; // you can also use id = null to auto increment

  @enumerated
  TopicCourse topic = TopicCourse.dart;

  @enumerated
  StatusCourse status = StatusCourse.pending;

  @Backlink(to: 'studentCourses')
  final studentstudentCourses = IsarLink<User>();

  @Backlink(to: 'studentNotes')
  final studentNotes = IsarLink<User>();

  @Backlink(to: 'teacher')
  final teacher = IsarLink<User>();

  @Backlink(to: 'courseId')
  final courseId = IsarLink<Payment>();

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

enum ScheduleClass { morning, afternoon, evening }

enum ModalClass {
  presencial,
  eClass,
  mixClass,
}

// the images names has to match enum TopicCourse
// so the icon course image can be load
enum TopicCourse {
  science,
  math,
  history,
  literature,
  dart,
}

enum StatusCourse {
  active,
  pending,
  deleted,
  suspended,
}
