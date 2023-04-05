// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPaymentsCollection on Isar {
  IsarCollection<Payments> get payments => this.collection();
}

const PaymentsSchema = CollectionSchema(
  name: r'Payments',
  id: 2793788798812849157,
  properties: {
    r'cuota': PropertySchema(
      id: 0,
      name: r'cuota',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 1,
      name: r'status',
      type: IsarType.byte,
      enumMap: _PaymentsstatusEnumValueMap,
    )
  },
  estimateSize: _paymentsEstimateSize,
  serialize: _paymentsSerialize,
  deserialize: _paymentsDeserialize,
  deserializeProp: _paymentsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'courseId': LinkSchema(
      id: -9171338076695123345,
      name: r'courseId',
      target: r'Course',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _paymentsGetId,
  getLinks: _paymentsGetLinks,
  attach: _paymentsAttach,
  version: '3.0.5',
);

int _paymentsEstimateSize(
  Payments object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _paymentsSerialize(
  Payments object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cuota);
  writer.writeByte(offsets[1], object.status.index);
}

Payments _paymentsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payments(
    cuota: reader.readLong(offsets[0]),
    id: id,
    status: _PaymentsstatusValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        StatusPayment.active,
  );
  return object;
}

P _paymentsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_PaymentsstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          StatusPayment.active) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PaymentsstatusEnumValueMap = {
  'active': 0,
  'pending': 1,
  'deleted': 2,
  'suspended': 3,
};
const _PaymentsstatusValueEnumMap = {
  0: StatusPayment.active,
  1: StatusPayment.pending,
  2: StatusPayment.deleted,
  3: StatusPayment.suspended,
};

Id _paymentsGetId(Payments object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _paymentsGetLinks(Payments object) {
  return [object.courseId];
}

void _paymentsAttach(IsarCollection<dynamic> col, Id id, Payments object) {
  object.id = id;
  object.courseId.attach(col, col.isar.collection<Course>(), r'courseId', id);
}

extension PaymentsQueryWhereSort on QueryBuilder<Payments, Payments, QWhere> {
  QueryBuilder<Payments, Payments, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentsQueryWhere on QueryBuilder<Payments, Payments, QWhereClause> {
  QueryBuilder<Payments, Payments, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Payments, Payments, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payments, Payments, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payments, Payments, QAfterWhereClause> idBetween(
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

extension PaymentsQueryFilter
    on QueryBuilder<Payments, Payments, QFilterCondition> {
  QueryBuilder<Payments, Payments, QAfterFilterCondition> cuotaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> cuotaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> cuotaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> cuotaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Payments, Payments, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Payments, Payments, QAfterFilterCondition> statusEqualTo(
      StatusPayment value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> statusGreaterThan(
    StatusPayment value, {
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

  QueryBuilder<Payments, Payments, QAfterFilterCondition> statusLessThan(
    StatusPayment value, {
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

  QueryBuilder<Payments, Payments, QAfterFilterCondition> statusBetween(
    StatusPayment lower,
    StatusPayment upper, {
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
}

extension PaymentsQueryObject
    on QueryBuilder<Payments, Payments, QFilterCondition> {}

extension PaymentsQueryLinks
    on QueryBuilder<Payments, Payments, QFilterCondition> {
  QueryBuilder<Payments, Payments, QAfterFilterCondition> courseId(
      FilterQuery<Course> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'courseId');
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> courseIdLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', length, true, length, true);
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> courseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, true, 0, true);
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> courseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, false, 999999, true);
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition>
      courseIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, true, length, include);
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition>
      courseIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', length, include, 999999, true);
    });
  }

  QueryBuilder<Payments, Payments, QAfterFilterCondition> courseIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'courseId', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PaymentsQuerySortBy on QueryBuilder<Payments, Payments, QSortBy> {
  QueryBuilder<Payments, Payments, QAfterSortBy> sortByCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuota', Sort.asc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> sortByCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuota', Sort.desc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PaymentsQuerySortThenBy
    on QueryBuilder<Payments, Payments, QSortThenBy> {
  QueryBuilder<Payments, Payments, QAfterSortBy> thenByCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuota', Sort.asc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> thenByCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuota', Sort.desc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Payments, Payments, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PaymentsQueryWhereDistinct
    on QueryBuilder<Payments, Payments, QDistinct> {
  QueryBuilder<Payments, Payments, QDistinct> distinctByCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuota');
    });
  }

  QueryBuilder<Payments, Payments, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension PaymentsQueryProperty
    on QueryBuilder<Payments, Payments, QQueryProperty> {
  QueryBuilder<Payments, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payments, int, QQueryOperations> cuotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuota');
    });
  }

  QueryBuilder<Payments, StatusPayment, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
