import 'package:gtxserv01/entities/course.dart';
import 'package:isar/isar.dart';

part 'payment.g.dart';

@collection
class Payment {
  Id? id; // you can also use id = null to auto increment

  int numCuota;

  double valueCuota;

  @enumerated
  PaymentStatus paymentStatus = PaymentStatus.pending;
  final courseId = IsarLinks<Course>();

  Payment({
    required this.id,
    required this.numCuota,
    required this.valueCuota,
    required this.paymentStatus,
  });
}

enum PaymentStatus {
  pending,
  success,
  failure,
}
