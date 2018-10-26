import 'package:flutter/material.dart';

import 'package:afyabora/ui/auth/login.dart';
import 'package:afyabora/ui/partials/navigation.dart';
import 'package:afyabora/ui/adddiagnosis.dart';
import 'package:afyabora/ui/auth/signup.dart';

final routes = <String, WidgetBuilder> {
  '/login': (BuildContext context) => Login(),
  '/dashboard': (BuildContext context) => Navigation(),
  '/adddiagnosis': (BuildContext context) => AddDiagnosis(),
  '/signup': (BuildContext context) => SignUp(),
};
