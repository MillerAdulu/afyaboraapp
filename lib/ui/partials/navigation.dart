import 'package:flutter/material.dart';

import 'package:afyabora/ui/dashboard.dart';
import 'package:afyabora/ui/diagnoses.dart';
import 'package:afyabora/ui/resources.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationPage createState() => _NavigationPage();
}

class Choice {
  const Choice({this.value, this.title, this.icon});

  final int value;
  final String title;
  final IconData icon;
}

class _NavigationPage extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [Dashboard(), Diagnoses(), Resources()];

  List<Choice> choices = const <Choice>[
    const Choice(value: 0, title: 'Log Out', icon: Icons.arrow_back),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afya Bora'),
        leading: Container(),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text('Medical History')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text('Resources')),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _select(Choice choice) {
    switch (choice.value) {
      case 0:
        {
          print('Logging out ...');
          // Scaffold.of(context)
          //     .showSnackBar(SnackBar(content: Text('You will be logged out!')));
          // Navigator.popUntil(context, ModalRoute.withName('/login'));
        }
        break;
    }
  }
}
