// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCourseCollection on Isar {
  IsarCollection<Course> get courses => this.collection();
}

const CourseSchema = CollectionSchema(
  name: r'Course',
  id: -5832084671214696602,
  properties: {
    r'coursecost': PropertySchema(
      id: 0,
      name: r'coursecost',
      type: IsarType.long,
    ),
    r'modalClass': PropertySchema(
      id: 1,
      name: r'modalClass',
      type: IsarType.byte,
      enumMap: _CoursemodalClassEnumValueMap,
    ),
    r'numCuotas': PropertySchema(
      id: 2,
      name: r'numCuotas',
      type: IsarType.long,
    ),
    r'scheduleClass': PropertySchema(
      id: 3,
      name: r'scheduleClass',
      type: IsarType.byte,
      enumMap: _CoursescheduleClassEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.byte,
      enumMap: _CoursestatusEnumValueMap,
    ),
    r'topic': PropertySchema(
      id: 5,
      name: r'topic',
      type: IsarType.byte,
      enumMap: _CoursetopicEnumValueMap,
    )
  },
  estimateSize: _courseEstimateSize,
  serialize: _courseSerialize,
  deserialize: _courseDeserialize,
  deserializeProp: _courseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'studentstudentCourses': LinkSchema(
      id: -5076528477139951577,
      name: r'studentstudentCourses',
      target: r'User',
      single: true,
      linkName: r'studentCourses',
    ),
    r'studentNotes': LinkSchema(
      id: 1805981327832005648,
      name: r'studentNotes',
      target: r'User',
      single: true,
      linkName: r'studentNotes',
    ),
    r'teacher': LinkSchema(
      id: -8896419655504169737,
      name: r'teacher',
      target: r'User',
      single: true,
      linkName: r'teacher',
    ),
    r'courseId': LinkSchema(
      id: -1200356941616023520,
      name: r'courseId',
      target: r'Payment',
      single: true,
      linkName: r'courseId',
    )
  },
  embeddedSchemas: {},
  getId: _courseGetId,
  getLinks: _courseGetLinks,
  attach: _courseAttach,
  version: '3.0.5',
);

int _courseEstimateSize(
  Course object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _courseSerialize(
  Course object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.coursecost);
  writer.writeByte(offsets[1], object.modalClass.index);
  writer.writeLong(offsets[2], object.numCuotas);
  writer.writeByte(offsets[3], object.scheduleClass.index);
  writer.writeByte(offsets[4], object.status.index);
  writer.writeByte(offsets[5], object.topic.index);
}

Course _courseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Course(
    coursecost: reader.readLong(offsets[0]),
    id: id,
    modalClass:
        _CoursemodalClassValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            ModalClass.presencial,
    numCuotas: reader.readLong(offsets[2]),
    scheduleClass:
        _CoursescheduleClassValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            ScheduleClass.morning,
    status: _CoursestatusValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        StatusCourse.active,
    topic: _CoursetopicValueEnumMap[reader.readByteOrNull(offsets[5])] ??
        TopicCourse.science,
  );
  return object;
}

P _courseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_CoursemodalClassValueEnumMap[reader.readByteOrNull(offset)] ??
          ModalClass.presencial) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (_CoursescheduleClassValueEnumMap[reader.readByteOrNull(offset)] ??
          ScheduleClass.morning) as P;
    case 4:
      return (_CoursestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          StatusCourse.active) as P;
    case 5:
      return (_CoursetopicValueEnumMap[reader.readByteOrNull(offset)] ??
          TopicCourse.science) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CoursemodalClassEnumValueMap = {
  'presencial': 0,
  'eClass': 1,
  'mixClass': 2,
};
const _CoursemodalClassValueEnumMap = {
  0: ModalClass.presencial,
  1: ModalClass.eClass,
  2: ModalClass.mixClass,
};
const _CoursescheduleClassEnumValueMap = {
  'morning': 0,
  'afternoon': 1,
  'evening': 2,
};
const _CoursescheduleClassValueEnumMap = {
  0: ScheduleClass.morning,
  1: ScheduleClass.afternoon,
  2: ScheduleClass.evening,
};
const _CoursestatusEnumValueMap = {
  'active': 0,
  'pending': 1,
  'deleted': 2,
  'suspended': 3,
};
const _CoursestatusValueEnumMap = {
  0: StatusCourse.active,
  1: StatusCourse.pending,
  2: StatusCourse.deleted,
  3: StatusCourse.suspended,
};
const _CoursetopicEnumValueMap = {
  'science': 0,
  'math': 1,
  'history': 2,
  'literature': 3,
  'dart': 4,
};
const _CoursetopicValueEnumMap = {
  0: TopicCourse.science,
  1: TopicCourse.math,
  2: TopicCourse.history,
  3: TopicCourse.literature,
  4: TopicCourse.dart,
};

Id _courseGetId(Course object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _courseGetLinks(Course object) {
  return [
    object.studentstudentCourses,
    object.studentNotes,
    object.teacher,
    object.courseId
  ];
}

void _courseAttach(IsarCollection<dynamic> col, Id id, Course object) {
  object.id = id;
  object.studentstudentCourses
      .attach(col, col.isar.collection<User>(), r'studentstudentCourses', id);
  object.studentNotes
      .attach(col, col.isar.collection<User>(), r'studentNotes', id);
  object.teacher.attach(col, col.isar.collection<User>(), r'teacher', id);
  object.courseId.attach(col, col.isar.collection<Payment>(), r'courseId', id);
}

extension CourseQueryWhereSort on QueryBuilder<Course, Course, QWhere> {
  QueryBuilder<Course, Course, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CourseQueryWhere on QueryBuilder<Course, Course, QWhereClause> {
  QueryBuilder<Course, Course, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Course, Course, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Course, Course, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Course, Course, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CourseQueryFilter on QueryBuilder<Course, Course, QFilterCondition> {
  QueryBuilder<Course, Course, QAfterFilterCondition> coursecostEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coursecost',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> coursecostGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coursecost',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> coursecostLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coursecost',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> coursecostBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coursecost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> modalClassEqualTo(
      ModalClass value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modalClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> modalClassGreaterThan(
    ModalClass value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modalClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> modalClassLessThan(
    ModalClass value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modalClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> modalClassBetween(
    ModalClass lower,
    ModalClass upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modalClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> numCuotasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> numCuotasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> numCuotasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> numCuotasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numCuotas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> scheduleClassEqualTo(
      ScheduleClass value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> scheduleClassGreaterThan(
    ScheduleClass value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduleClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> scheduleClassLessThan(
    ScheduleClass value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduleClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> scheduleClassBetween(
    ScheduleClass lower,
    ScheduleClass upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduleClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> statusEqualTo(
      StatusCourse value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> statusGreaterThan(
    StatusCourse value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> statusLessThan(
    StatusCourse value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> statusBetween(
    StatusCourse lower,
    StatusCourse upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> topicEqualTo(
      TopicCourse value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topic',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> topicGreaterThan(
    TopicCourse value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topic',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> topicLessThan(
    TopicCourse value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topic',
        value: value,
      ));
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> topicBetween(
    TopicCourse lower,
    TopicCourse upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CourseQueryObject on QueryBuilder<Course, Course, QFilterCondition> {}

extension CourseQueryLinks on QueryBuilder<Course, Course, QFilterCondition> {
  QueryBuilder<Course, Course, QAfterFilterCondition> studentstudentCourses(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'studentstudentCourses');
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition>
      studentstudentCoursesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'studentstudentCourses', 0, true, 0, true);
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> studentNotes(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'studentNotes');
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> studentNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'studentNotes', 0, true, 0, true);
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> teacher(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'teacher');
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> teacherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'teacher', 0, true, 0, true);
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> courseId(
      FilterQuery<Payment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'courseId');
    });
  }

  QueryBuilder<Course, Course, QAfterFilterCondition> courseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, true, 0, true);
    });
  }
}

extension CourseQuerySortBy on QueryBuilder<Course, Course, QSortBy> {
  QueryBuilder<Course, Course, QAfterSortBy> sortByCoursecost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coursecost', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByCoursecostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coursecost', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByModalClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modalClass', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByModalClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modalClass', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByNumCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuotas', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByNumCuotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuotas', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByScheduleClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleClass', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByScheduleClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleClass', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> sortByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension CourseQuerySortThenBy on QueryBuilder<Course, Course, QSortThenBy> {
  QueryBuilder<Course, Course, QAfterSortBy> thenByCoursecost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coursecost', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByCoursecostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coursecost', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByModalClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modalClass', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByModalClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modalClass', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByNumCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuotas', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByNumCuotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuotas', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByScheduleClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleClass', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByScheduleClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleClass', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<Course, Course, QAfterSortBy> thenByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension CourseQueryWhereDistinct on QueryBuilder<Course, Course, QDistinct> {
  QueryBuilder<Course, Course, QDistinct> distinctByCoursecost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coursecost');
    });
  }

  QueryBuilder<Course, Course, QDistinct> distinctByModalClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modalClass');
    });
  }

  QueryBuilder<Course, Course, QDistinct> distinctByNumCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numCuotas');
    });
  }

  QueryBuilder<Course, Course, QDistinct> distinctByScheduleClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleClass');
    });
  }

  QueryBuilder<Course, Course, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Course, Course, QDistinct> distinctByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topic');
    });
  }
}

extension CourseQueryProperty on QueryBuilder<Course, Course, QQueryProperty> {
  QueryBuilder<Course, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Course, int, QQueryOperations> coursecostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coursecost');
    });
  }

  QueryBuilder<Course, ModalClass, QQueryOperations> modalClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modalClass');
    });
  }

  QueryBuilder<Course, int, QQueryOperations> numCuotasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numCuotas');
    });
  }

  QueryBuilder<Course, ScheduleClass, QQueryOperations>
      scheduleClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleClass');
    });
  }

  QueryBuilder<Course, StatusCourse, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Course, TopicCourse, QQueryOperations> topicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topic');
    });
  }
}
