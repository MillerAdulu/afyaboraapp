import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:afyabora/utils/api.dart';
import 'package:afyabora/models/users/user.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpData {
  String email = '';
  String password = '';
  String weight = '';
  String height = '';
  String bloodGroup = '';
  String firstName = '';
  String lastName = '';
}

class _SignUpFormState extends State<SignUp> {
  final _signUpFormKey = GlobalKey<FormState>();
  SharedPreferences prefs;

  _SignUpData _credentials = new _SignUpData();

  @override
  void initState() {
    checkSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afya Bora',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Afya Bora')
        ),
        body: Center(
          child: Form(
        key: _signUpFormKey,
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: ListView(children: <Widget>[
              // LinearProgressIndicator(value: null),
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
              TextFormField(
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'John', labelText: 'First Name'),
                validator: this._validateName,
                onSaved: (String firstName) {
                  this._credentials.firstName = firstName;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'Doe', labelText: 'Last Name'),
                validator: this._validateName,
                onSaved: (String lastName) {
                  this._credentials.lastName = lastName;
                },
              ),
              // RadioListTile(title: Text('Gender'), groupValue: ,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration:
                    InputDecoration(hintText: '50.5', labelText: 'Weight'),
                validator: this._validateValue,
                onSaved: (String weight) {
                  this._credentials.weight = weight;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration:
                    InputDecoration(hintText: '1.76', labelText: 'Height'),
                validator: this._validateValue,
                onSaved: (String height) {
                  this._credentials.height = height;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'A', labelText: 'Blood Group'),
                validator: this._validateName,
                onSaved: (String bloodGroup) {
                  this._credentials.bloodGroup = bloodGroup;
                },
              ),
              // TextFormField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //       hintText: 'John', labelText: 'Last Name'),
              //   validator: this._validateName,
              //   onSaved: (String lastName) {
              //     this._credentials.lastName = lastName;
              //   },
              // ),
              Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    onPressed: this._signUp,
                    color: Colors.blue,
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ]))),
        )));
  }

  void _signUp() {
    if (_signUpFormKey.currentState.validate()) {
      _signUpFormKey.currentState.save();
      FocusScope.of(context).requestFocus(FocusNode());

      api.signUp().then((loggedInUser) {
        if (loggedInUser is UserData) {
          saveUserData(loggedInUser.user);
          Navigator.pushNamed(context, '/dashboard');
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: const Text(
                'Unable to log you in. Please recheck your credentials.'),
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
    prefs.setString('insurance', loggedInUser.insurance);
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

  String _validateValue(String value) {
    if (double.tryParse(value) == null) {
      return 'Please input a valid figure';
    }
    return null;
  }

  String _validateName(String value) {
    try {
      Validate.isAlphaNumeric(value);
    } catch (e) {
      return 'Please input a valid name';
    }
    return null;
  }
}
