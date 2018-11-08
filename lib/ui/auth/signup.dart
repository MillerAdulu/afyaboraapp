import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_hud/progress_hud.dart';

import 'package:afyabora/utils/api.dart';
import 'package:afyabora/models/users/user.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sign Up')),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: RegisterForm(),
        ));
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class _RegisterData {
  String email = '';
  String password = '';
  String weight = '';
  String height = '';
  String bloodGroup = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
}

class RegisterFormState extends State<RegisterForm> {
  final _signFormKey = GlobalKey<FormState>();
  SharedPreferences prefs;

  _RegisterData _credentials = new _RegisterData();

  ProgressHUD progressIndicator = ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.blue,
    borderRadius: 5.0,
    text: 'Registering... ',
  );

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Form(
        key: _signFormKey,
        autovalidate: true,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration:
                InputDecoration(hintText: 'John', labelText: 'First Name'),
            validator: this._validateName,
            onSaved: (String name) {
              this._credentials.firstName = name;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration:
                InputDecoration(hintText: 'Doe', labelText: 'Last Name'),
            validator: this._validateName,
            onSaved: (String name) {
              this._credentials.lastName = name;
            },
          ),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'me@mail.com', labelText: 'E-mail Address'),
              validator: _validateEmail,
              onSaved: (email) => this._credentials.email = email),
          TextFormField(
            obscureText: true,
            decoration:
                InputDecoration(hintText: 'password', labelText: 'Password'),
            validator: this._validatePassword,
            onSaved: (String password) {
              this._credentials.password = password;
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Gender'),
              RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: this._credentials.gender,
                onChanged: (String value) {
                  setState(() {
                    this._credentials.gender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: this._credentials.gender,
                onChanged: (String value) {
                  setState(() {
                    this._credentials.gender = value;
                  });
                },
              ),
            ],
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(hintText: '50.5', labelText: 'Weight'),
            validator: this._validateValue,
            onSaved: (String weight) {
              this._credentials.weight = weight;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(hintText: '1.76', labelText: 'Height'),
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
          Divider(),
          Container(
              width: screenSize.width,
              child: RaisedButton(
                onPressed: this._register,
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ])));
  }

  void _register() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return progressIndicator;
        });

    if (this._signFormKey.currentState.validate()) {
      _signFormKey.currentState.save();

      FocusScope.of(context).requestFocus(FocusNode());

      api
          .signUp(
              _credentials.email,
              _credentials.password,
              _credentials.firstName,
              _credentials.lastName,
              _credentials.weight,
              _credentials.height,
              _credentials.bloodGroup,
              _credentials.gender)
          .then((loggedInUser) {
        if (loggedInUser is UserData) {
          saveUserData(loggedInUser.user);
          Navigator.pushNamed(context, '/navigation');
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content:
                const Text('Unable to register you. Please try again later.'),
          ));
          return null;
        }
      });
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

  String _validateName(String value) {
    try {
      Validate.isAlphaNumeric(value);
    } catch (e) {
      return 'Please input a valid name';
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
}
