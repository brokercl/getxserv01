// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPaymentCollection on Isar {
  IsarCollection<Payment> get payments => this.collection();
}

const PaymentSchema = CollectionSchema(
  name: r'Payment',
  id: -6533700744042574122,
  properties: {
    r'numCuota': PropertySchema(
      id: 0,
      name: r'numCuota',
      type: IsarType.long,
    ),
    r'paymentStatus': PropertySchema(
      id: 1,
      name: r'paymentStatus',
      type: IsarType.byte,
      enumMap: _PaymentpaymentStatusEnumValueMap,
    ),
    r'valueCuota': PropertySchema(
      id: 2,
      name: r'valueCuota',
      type: IsarType.double,
    )
  },
  estimateSize: _paymentEstimateSize,
  serialize: _paymentSerialize,
  deserialize: _paymentDeserialize,
  deserializeProp: _paymentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'courseId': LinkSchema(
      id: 6722863071756230600,
      name: r'courseId',
      target: r'Course',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _paymentGetId,
  getLinks: _paymentGetLinks,
  attach: _paymentAttach,
  version: '3.0.5',
);

int _paymentEstimateSize(
  Payment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _paymentSerialize(
  Payment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.numCuota);
  writer.writeByte(offsets[1], object.paymentStatus.index);
  writer.writeDouble(offsets[2], object.valueCuota);
}

Payment _paymentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payment(
    id: id,
    numCuota: reader.readLong(offsets[0]),
    paymentStatus:
        _PaymentpaymentStatusValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            PaymentStatus.pending,
    valueCuota: reader.readDouble(offsets[2]),
  );
  return object;
}

P _paymentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_PaymentpaymentStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PaymentStatus.pending) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PaymentpaymentStatusEnumValueMap = {
  'pending': 0,
  'success': 1,
  'failure': 2,
};
const _PaymentpaymentStatusValueEnumMap = {
  0: PaymentStatus.pending,
  1: PaymentStatus.success,
  2: PaymentStatus.failure,
};

Id _paymentGetId(Payment object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _paymentGetLinks(Payment object) {
  return [object.courseId];
}

void _paymentAttach(IsarCollection<dynamic> col, Id id, Payment object) {
  object.id = id;
  object.courseId.attach(col, col.isar.collection<Course>(), r'courseId', id);
}

extension PaymentQueryWhereSort on QueryBuilder<Payment, Payment, QWhere> {
  QueryBuilder<Payment, Payment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentQueryWhere on QueryBuilder<Payment, Payment, QWhereClause> {
  QueryBuilder<Payment, Payment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Payment, Payment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idBetween(
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

extension PaymentQueryFilter
    on QueryBuilder<Payment, Payment, QFilterCondition> {
  QueryBuilder<Payment, Payment, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Payment, Payment, QAfterFilterCondition> numCuotaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numCuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> numCuotaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numCuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> numCuotaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numCuota',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> numCuotaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numCuota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentStatusEqualTo(
      PaymentStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      paymentStatusGreaterThan(
    PaymentStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentStatusLessThan(
    PaymentStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> paymentStatusBetween(
    PaymentStatus lower,
    PaymentStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> valueCuotaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> valueCuotaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valueCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> valueCuotaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valueCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> valueCuotaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valueCuota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PaymentQueryObject
    on QueryBuilder<Payment, Payment, QFilterCondition> {}

extension PaymentQueryLinks
    on QueryBuilder<Payment, Payment, QFilterCondition> {
  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseId(
      FilterQuery<Course> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'courseId');
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseIdLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', length, true, length, true);
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, true, 0, true);
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, false, 999999, true);
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', 0, true, length, include);
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      courseIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courseId', length, include, 999999, true);
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> courseIdLengthBetween(
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

extension PaymentQuerySortBy on QueryBuilder<Payment, Payment, QSortBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> sortByNumCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuota', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByNumCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuota', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByValueCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueCuota', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByValueCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueCuota', Sort.desc);
    });
  }
}

extension PaymentQuerySortThenBy
    on QueryBuilder<Payment, Payment, QSortThenBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByNumCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuota', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByNumCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numCuota', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStatus', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByValueCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueCuota', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByValueCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueCuota', Sort.desc);
    });
  }
}

extension PaymentQueryWhereDistinct
    on QueryBuilder<Payment, Payment, QDistinct> {
  QueryBuilder<Payment, Payment, QDistinct> distinctByNumCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numCuota');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByPaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentStatus');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByValueCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueCuota');
    });
  }
}

extension PaymentQueryProperty
    on QueryBuilder<Payment, Payment, QQueryProperty> {
  QueryBuilder<Payment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payment, int, QQueryOperations> numCuotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numCuota');
    });
  }

  QueryBuilder<Payment, PaymentStatus, QQueryOperations>
      paymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentStatus');
    });
  }

  QueryBuilder<Payment, double, QQueryOperations> valueCuotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueCuota');
    });
  }
}
