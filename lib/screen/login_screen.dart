import 'package:flutter/material.dart';
import 'package:todo_app/screen/homescreen.dart';
import 'package:todo_app/widget/floatingaction.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          floatingactionbutton(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
