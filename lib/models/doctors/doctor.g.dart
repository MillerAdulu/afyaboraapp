// GENERATED CODE - DO NOT MODIFY BY HAND

part of doctor;

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

Serializer<DoctorData> _$doctorDataSerializer = new _$DoctorDataSerializer();
Serializer<Doctor> _$doctorSerializer = new _$DoctorSerializer();

class _$DoctorDataSerializer implements StructuredSerializer<DoctorData> {
  @override
  final Iterable<Type> types = const [DoctorData, _$DoctorData];
  @override
  final String wireName = 'DoctorData';

  @override
  Iterable serialize(Serializers serializers, DoctorData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Doctor)])),
    ];

    return result;
  }

  @override
  DoctorData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Doctor)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorSerializer implements StructuredSerializer<Doctor> {
  @override
  final Iterable<Type> types = const [Doctor, _$Doctor];
  @override
  final String wireName = 'Doctor';

  @override
  Iterable serialize(Serializers serializers, Doctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'docID',
      serializers.serialize(object.docID,
          specifiedType: const FullType(String)),
      'surname',
      serializers.serialize(object.surname,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Doctor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'docID':
          result.docID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorData extends DoctorData {
  @override
  final BuiltList<Doctor> data;

  factory _$DoctorData([void updates(DoctorDataBuilder b)]) =>
      (new DoctorDataBuilder()..update(updates)).build();

  _$DoctorData._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('DoctorData', 'data');
    }
  }

  @override
  DoctorData rebuild(void updates(DoctorDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorDataBuilder toBuilder() => new DoctorDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorData && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoctorData')..add('data', data))
        .toString();
  }
}

class DoctorDataBuilder implements Builder<DoctorData, DoctorDataBuilder> {
  _$DoctorData _$v;

  ListBuilder<Doctor> _data;
  ListBuilder<Doctor> get data => _$this._data ??= new ListBuilder<Doctor>();
  set data(ListBuilder<Doctor> data) => _$this._data = data;

  DoctorDataBuilder();

  DoctorDataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DoctorData;
  }

  @override
  void update(void updates(DoctorDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DoctorData build() {
    _$DoctorData _$result;
    try {
      _$result = _$v ?? new _$DoctorData._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DoctorData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Doctor extends Doctor {
  @override
  final String docID;
  @override
  final String surname;
  @override
  final String email;

  factory _$Doctor([void updates(DoctorBuilder b)]) =>
      (new DoctorBuilder()..update(updates)).build();

  _$Doctor._({this.docID, this.surname, this.email}) : super._() {
    if (docID == null) {
      throw new BuiltValueNullFieldError('Doctor', 'docID');
    }
    if (surname == null) {
      throw new BuiltValueNullFieldError('Doctor', 'surname');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Doctor', 'email');
    }
  }

  @override
  Doctor rebuild(void updates(DoctorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorBuilder toBuilder() => new DoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Doctor &&
        docID == other.docID &&
        surname == other.surname &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, docID.hashCode), surname.hashCode), email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Doctor')
          ..add('docID', docID)
          ..add('surname', surname)
          ..add('email', email))
        .toString();
  }
}

class DoctorBuilder implements Builder<Doctor, DoctorBuilder> {
  _$Doctor _$v;

  String _docID;
  String get docID => _$this._docID;
  set docID(String docID) => _$this._docID = docID;

  String _surname;
  String get surname => _$this._surname;
  set surname(String surname) => _$this._surname = surname;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DoctorBuilder();

  DoctorBuilder get _$this {
    if (_$v != null) {
      _docID = _$v.docID;
      _surname = _$v.surname;
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Doctor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Doctor;
  }

  @override
  void update(void updates(DoctorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Doctor build() {
    final _$result =
        _$v ?? new _$Doctor._(docID: docID, surname: surname, email: email);
    replace(_$result);
    return _$result;
  }
}
