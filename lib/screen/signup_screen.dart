import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/google_sign_in.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            child: Image.asset('images/login.png'),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            child: ElevatedButton.icon(
              label: Text("Login with Google"),
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
