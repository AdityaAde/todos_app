import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screen/login_screen.dart';
import 'package:todo_app/screen/signup_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Login();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return SignUp();
          }
        },
      ),
    );
  }
}
