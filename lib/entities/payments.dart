import 'package:gtxserv01/entities/course.dart';
import 'package:isar/isar.dart';

part 'payments.g.dart';

@collection
class Payments {
  Id? id; // you can also use id = null to auto increment

  int cuota;
  @enumerated
  StatusPayment status = StatusPayment.pending;
  final courseId = IsarLinks<Course>();

  Payments({
    required this.id,
    required this.cuota,
    required this.status,
  });
}

enum StatusPayment {
  active,
  pending,
  deleted,
  suspended,
}
