import 'package:flutter/material.dart';

import 'package:afyabora/ui/auth/login.dart';
import 'utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afya Bora',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Afya Bora')
        ),
        body: Center(
          child: Login()
          )
      ),
      routes: routes,
    );
  }
}

