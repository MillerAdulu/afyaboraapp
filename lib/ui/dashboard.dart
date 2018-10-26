import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String id, email, firstName, lastName, gender;
  double weight, height;

  @override
  Widget build(BuildContext context) {
    getSharedPreferences();
    return Card(
        child: SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: 'https://picsum.photos/400',
        ),
        ListTile(
          leading: Icon(Icons.perm_identity),
          title: Text('Member ID'),
          subtitle: Text('$id'),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Names'),
          subtitle: Text('$lastName, $firstName'),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('Names'),
          subtitle: Text('$email'),
        ),
        ListTile(
          leading: Icon(Icons.linear_scale),
          title: Text('Height'),
          subtitle: Text('${height.toString()}'),
        ),
        ListTile(
          leading: Icon(Icons.linear_scale),
          title: Text('Weight'),
          subtitle: Text('${weight.toString()}'),
        ),
      ]),
    ));
  }

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('userId');
      email = prefs.getString('email');
      firstName = prefs.getString('firstName');
      lastName = prefs.getString('lastName');
      gender = prefs.getString('gender');
      weight = prefs.getDouble('weight');
      height = prefs.getDouble('height');
    });
  }
}
