import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_hud/progress_hud.dart';

import 'package:afyabora/utils/api.dart';
import 'package:afyabora/models/users/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginFormState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  SharedPreferences prefs;
  ProgressHUD progressIndicator = ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0);

  @override
  void initState() {
    checkSharedPreferences();
    super.initState();
  }

  _LoginData _credentials = new _LoginData();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Form(
      autovalidate: true,
        key: _loginFormKey,
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: ListView(children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'me@mail.com', labelText: 'E-mail Address'),
                validator: this._validateEmail,
                onSaved: (String email) {
                  this._credentials.email = email;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', labelText: 'Password'),
                validator: this._validatePassword,
                onSaved: (String password) {
                  this._credentials.password = password;
                },
              ),
              Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    onPressed: this._login,
                    color: Colors.blue,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              // Divider(),
              // Container(
              //     width: screenSize.width,
              //     child: RaisedButton(
              //       onPressed: this._signUp,
              //       color: Colors.blue,
              //       child: Text(
              //         'Sign Up',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     )),
            ])));
  }

  // void _signUp() {
  //   Navigator.pushNamed(context, '/signup');
  // }

  void _login() {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return progressIndicator;
        });
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      FocusScope.of(context).requestFocus(FocusNode());

      api.login(_credentials.email, _credentials.password).then((loggedInUser) {
        if (loggedInUser is UserData) {
          saveUserData(loggedInUser.user);
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          Navigator.of(context).pop();
          Scaffold.of(context).showSnackBar(SnackBar(
            content:
                Text('Unable to log you in. Please recheck your credentials.'),
          ));
          return null;
        }
      });
    }
  }

  checkSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userId') != null) {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  saveUserData(loggedInUser) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', loggedInUser.id);
    prefs.setString('email', loggedInUser.email);
    prefs.setString('firstName', loggedInUser.firstName);
    prefs.setString('lastName', loggedInUser.lastName);
    prefs.setString('gender', loggedInUser.gender);
    prefs.setDouble('weight', loggedInUser.weight);
    prefs.setDouble('height', loggedInUser.height);
  }

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'Please input a valid email';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 4) {
      return 'The password must be at least 4 characters';
    }
    return null;
  }
}
