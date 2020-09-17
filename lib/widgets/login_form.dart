import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/home_screen.dart';
import 'package:flutter_workshop/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/state/auth_state.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          controller: _email,
          decoration: InputDecoration(hintText: "email address"),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _password,
          obscureText: true,
          decoration: InputDecoration(hintText: "password"),
        ),
        const SizedBox(height: 10.0),
        RaisedButton(
          child: Text("Login"),
          onPressed: () async {
            final email = _email.text;
            final pass = _password.text;
            print("email: $email, password: $pass");
            final user =
                await AuthService.loginWithEmail(email: email, password: pass);
            if (user != null) {
              /* Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              })); */
              Navigator.pop(context);
            } else {
              print("error logging in");
            }
          },
        )
      ],
    );
  }
}
