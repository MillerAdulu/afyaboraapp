// GENERATED CODE - DO NOT MODIFY BY HAND

part of diagnosis;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<DiagnosisData> _$diagnosisDataSerializer =
    new _$DiagnosisDataSerializer();
Serializer<Diagnosis> _$diagnosisSerializer = new _$DiagnosisSerializer();

class _$DiagnosisDataSerializer implements StructuredSerializer<DiagnosisData> {
  @override
  final Iterable<Type> types = const [DiagnosisData, _$DiagnosisData];
  @override
  final String wireName = 'DiagnosisData';

  @override
  Iterable serialize(Serializers serializers, DiagnosisData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'record',
      serializers.serialize(object.record,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Diagnosis)])),
    ];

    return result;
  }

  @override
  DiagnosisData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiagnosisDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'record':
          result.record.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Diagnosis)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$DiagnosisSerializer implements StructuredSerializer<Diagnosis> {
  @override
  final Iterable<Type> types = const [Diagnosis, _$Diagnosis];
  @override
  final String wireName = 'Diagnosis';

  @override
  Iterable serialize(Serializers serializers, Diagnosis object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.diagnosis != null) {
      result
        ..add('diagnosis')
        ..add(serializers.serialize(object.diagnosis,
            specifiedType: const FullType(String)));
    }
    if (object.dosage != null) {
      result
        ..add('dosage')
        ..add(serializers.serialize(object.dosage,
            specifiedType: const FullType(String)));
    }
    if (object.center != null) {
      result
        ..add('center')
        ..add(serializers.serialize(object.center,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Diagnosis deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiagnosisBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'diagnosis':
          result.diagnosis = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dosage':
          result.dosage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'center':
          result.center = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DiagnosisData extends DiagnosisData {
  @override
  final BuiltList<Diagnosis> record;

  factory _$DiagnosisData([void updates(DiagnosisDataBuilder b)]) =>
      (new DiagnosisDataBuilder()..update(updates)).build();

  _$DiagnosisData._({this.record}) : super._() {
    if (record == null) {
      throw new BuiltValueNullFieldError('DiagnosisData', 'record');
    }
  }

  @override
  DiagnosisData rebuild(void updates(DiagnosisDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiagnosisDataBuilder toBuilder() => new DiagnosisDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiagnosisData && record == other.record;
  }

  @override
  int get hashCode {
    return $jf($jc(0, record.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiagnosisData')..add('record', record))
        .toString();
  }
}

class DiagnosisDataBuilder
    implements Builder<DiagnosisData, DiagnosisDataBuilder> {
  _$DiagnosisData _$v;

  ListBuilder<Diagnosis> _record;
  ListBuilder<Diagnosis> get record =>
      _$this._record ??= new ListBuilder<Diagnosis>();
  set record(ListBuilder<Diagnosis> record) => _$this._record = record;

  DiagnosisDataBuilder();

  DiagnosisDataBuilder get _$this {
    if (_$v != null) {
      _record = _$v.record?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiagnosisData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiagnosisData;
  }

  @override
  void update(void updates(DiagnosisDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DiagnosisData build() {
    _$DiagnosisData _$result;
    try {
      _$result = _$v ?? new _$DiagnosisData._(record: record.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'record';
        record.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiagnosisData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Diagnosis extends Diagnosis {
  @override
  final String diagnosis;
  @override
  final String dosage;
  @override
  final String center;
  @override
  final String date;

  factory _$Diagnosis([void updates(DiagnosisBuilder b)]) =>
      (new DiagnosisBuilder()..update(updates)).build();

  _$Diagnosis._({this.diagnosis, this.dosage, this.center, this.date})
      : super._();

  @override
  Diagnosis rebuild(void updates(DiagnosisBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DiagnosisBuilder toBuilder() => new DiagnosisBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Diagnosis &&
        diagnosis == other.diagnosis &&
        dosage == other.dosage &&
        center == other.center &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, diagnosis.hashCode), dosage.hashCode), center.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Diagnosis')
          ..add('diagnosis', diagnosis)
          ..add('dosage', dosage)
          ..add('center', center)
          ..add('date', date))
        .toString();
  }
}

class DiagnosisBuilder implements Builder<Diagnosis, DiagnosisBuilder> {
  _$Diagnosis _$v;

  String _diagnosis;
  String get diagnosis => _$this._diagnosis;
  set diagnosis(String diagnosis) => _$this._diagnosis = diagnosis;

  String _dosage;
  String get dosage => _$this._dosage;
  set dosage(String dosage) => _$this._dosage = dosage;

  String _center;
  String get center => _$this._center;
  set center(String center) => _$this._center = center;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  DiagnosisBuilder();

  DiagnosisBuilder get _$this {
    if (_$v != null) {
      _diagnosis = _$v.diagnosis;
      _dosage = _$v.dosage;
      _center = _$v.center;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Diagnosis other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Diagnosis;
  }

  @override
  void update(void updates(DiagnosisBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Diagnosis build() {
    final _$result = _$v ??
        new _$Diagnosis._(
            diagnosis: diagnosis, dosage: dosage, center: center, date: date);
    replace(_$result);
    return _$result;
  }
}
