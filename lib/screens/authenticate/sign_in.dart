// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfiebase/screens/authenticate/register.dart';
import 'package:myfiebase/screens/wrapper.dart';
import 'package:myfiebase/services/auth.dart';
import 'package:myfiebase/shared/constants.dart';
import 'package:myfiebase/shared/loading.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  TextEditingController prev_email = TextEditingController();
  TextEditingController prev_pass = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.pink[50],
            appBar: AppBar(
              backgroundColor: Colors.pink[400],
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  icon: Icon(
                    Icons.switch_account_rounded,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              // ignore: deprecated_member_use
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: prev_email,
                      decoration: textInputDecoration,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) =>
                          setState(() => email = value.toString()),
                      style: TextStyle(),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: prev_pass,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.password,
                          color: Colors.pink[600],
                        ),
                      ),
                      validator: (value) => value!.length < 6
                          ? 'Password must be more than 6 charecter!'
                          : null,
                      onChanged: (value) =>
                          setState(() => password = value.toString()),
                      style: TextStyle(),
                    ),
                    const SizedBox(height: 20.0),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () async {
                        // Check if user exist!
                        // if Exits -> Redrict to home page else -> Try again or sign up option.

                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = "Email or password is wrong!";
                              loading = false;
                            });
                          }
                        }
                      },
                      color: Colors.pink[400],
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.pink[600]),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
