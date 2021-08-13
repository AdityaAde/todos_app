import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/google_sign_in.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(
            height: 10,
          ),
          Text(user.displayName),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              final userlogin =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              userlogin.logout();
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
