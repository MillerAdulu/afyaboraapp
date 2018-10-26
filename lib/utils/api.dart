import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'network.dart';
import 'package:afyabora/serializer/serializers.dart';

import 'package:afyabora/models/users/user.dart';
import 'package:afyabora/models/diagnoses/diagnosis.dart';
import 'package:afyabora/models/doctors/doctor.dart';
import 'package:afyabora/models/resources/resource.dart';

class AfyaBoraAPI {
  NetworkUtil _netUtil = new NetworkUtil();
  static final String baseUrl = 'https://afya-bora.herokuapp.com';
  String userId;

  Future<UserData> signUp() async {
    final String signUpUrl = '$baseUrl/user';

    return _netUtil.post(signUpUrl, body: {}).then((dynamic res) {
      if(res == null) return null;
      return serializers.deserializeWith(UserData.serializer, res);
    });
  }

  Future<UserData> login(String email, String password) async {
    getSharedPreferences();
    final String loginUrl = '$baseUrl/auth/login';
    return _netUtil.post(loginUrl,
        body: {'email': email, 'password': password}).then((dynamic res) {
      if (res == null) return null;
      return serializers.deserializeWith(UserData.serializer, res);
    });
  }


  Future<List<Diagnosis>> getDiagnoses() async {
    getSharedPreferences();
    final String diagnosesUrl = '$baseUrl/api/user/$userId/med-track';
    return _netUtil.get(diagnosesUrl).then((dynamic res) {
      print('Diagnoses');
      print(res);
      if (res == null) return null;

      DiagnosisData diagnosisData = serializers.deserializeWith(DiagnosisData.serializer, res);
      return diagnosisData.record.map<Diagnosis>((Diagnosis diagnosis) => diagnosis).toList();
    });
  }

  Future<Null> addDiagnosis(
    String diagnosis,
    String center,
    String symptoms,
    String dosage
  ) async {
    getSharedPreferences();
    final String addDiagnosisUrl = '$baseUrl/api/user/$userId/med-track';

    return _netUtil.post(addDiagnosisUrl, body: {
      'userID': userId,
      'diagnosis': diagnosis,
      'center': center,
      'symptoms': symptoms,
      'dosage': dosage,
      'docID': '2'
    }).then((dynamic res) {
      return null;
    });

  }

  Future<List<Doctor>> getDoctors() {
    final String doctorsUrl = '$baseUrl/doctor';

    return _netUtil.get(doctorsUrl).then((dynamic res) {
      DoctorData doctorData = serializers.deserializeWith(DoctorData.serializer, res);
       return doctorData.data.map<Doctor>((Doctor doctor) => doctor).toList();
    });
  }

  Future<List<Resource> >getResources() {
    final String resourcesUrl = '$baseUrl/api/article';

    return _netUtil.get(resourcesUrl).then((dynamic res) {
      ResourceData resourceData = serializers.deserializeWith(ResourceData.serializer, res);
       return resourceData.articles.map<Resource>((Resource resource) => resource).toList();
    });
  }

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
  }
}

AfyaBoraAPI api = new AfyaBoraAPI();
