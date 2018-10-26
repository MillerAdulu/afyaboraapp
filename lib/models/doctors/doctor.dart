library doctor;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'doctor.g.dart';

abstract class DoctorData implements Built<DoctorData, DoctorDataBuilder> {
  BuiltList<Doctor> get data;

  DoctorData._();
  factory DoctorData([updates(DoctorDataBuilder doctorDataBuilder)]) = _$DoctorData;
  static Serializer<DoctorData> get serializer => _$doctorDataSerializer;
}

abstract class Doctor implements Built<Doctor, DoctorBuilder> {
  
  String get docID;
  String get surname;
  String get email;

  Doctor._();
  factory Doctor([updates(DoctorBuilder doctorBuilder)]) = _$Doctor;
  static Serializer<Doctor> get serializer => _$doctorSerializer;

}
