import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? name;
  int? age;

  List<Courses>? courses;

  @enumerated
  Status status = Status.pending;
}

@embedded
class Courses {
  String? course;

  String? teacher;
}

enum Status {
  active,
  pending,
  deleted,
  suspended,
}
