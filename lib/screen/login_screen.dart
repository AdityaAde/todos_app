import 'package:flutter/material.dart';
import 'package:todo_app/screen/homescreen.dart';
import 'package:todo_app/screen/logout_screen.dart';
import 'package:todo_app/widget/floatingaction.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<Widget> _children = [
    HomeScreen(),
    LogOut(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          floatingactionbutton(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
