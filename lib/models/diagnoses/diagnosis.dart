library diagnosis;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'diagnosis.g.dart';

abstract class DiagnosisData implements Built<DiagnosisData, DiagnosisDataBuilder> {
  BuiltList<Diagnosis> get record;

  DiagnosisData._();
  factory DiagnosisData([updates(DiagnosisDataBuilder diagnosisDataBuilder)]) = _$DiagnosisData;
  static Serializer<DiagnosisData> get serializer => _$diagnosisDataSerializer;
}

abstract class Diagnosis implements Built<Diagnosis, DiagnosisBuilder> {
  @nullable
  String get diagnosis;
  @nullable
  String get dosage;
  @nullable
  String get center;
  @nullable
  String get date;


  Diagnosis._();
  factory Diagnosis([updates(DiagnosisBuilder diagnosisBuilder)]) = _$Diagnosis;
  static Serializer<Diagnosis> get serializer => _$diagnosisSerializer;

}


