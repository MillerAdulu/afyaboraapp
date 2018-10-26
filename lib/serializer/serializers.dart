library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:afyabora/models/users/user.dart';
import 'package:afyabora/models/diagnoses/diagnosis.dart';
import 'package:afyabora/models/doctors/doctor.dart';
import 'package:afyabora/models/resources/resource.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  User,
  UserData,
  DiagnosisData,
  Diagnosis,
  DoctorData,
  Doctor,
  ResourceData,
  Resource,
])

final Serializers serializers = (
  _$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin())
).build();