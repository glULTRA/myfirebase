// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myfiebase/screens/authenticate/authenticate.dart';
import 'package:myfiebase/screens/authenticate/sign_in.dart';
import 'package:myfiebase/screens/wrapper.dart';
import 'package:myfiebase/services/auth.dart';
import 'package:myfiebase/shared/constants.dart';
import 'package:myfiebase/shared/loading.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              title: Text('Sign up'),
              //actions: <Widget>[
              //  FlatButton.icon(
              //    onPressed: () {
              //      Navigator.push(
              //          context, MaterialPageRoute(builder: (context) => SignIn()));
              //    },
              //    icon: Icon(
              //      Icons.switch_account_rounded,
              //      color: Colors.white,
              //    ),
              //    label: Text(
              //      "Sign in",
              //      style: TextStyle(color: Colors.white),
              //    ),
              //  ),
              //],
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
                        // it should tell me i'm already signed up!
                        // Redrict to login page or to home page.
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Please enter a vaild email.';
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
                      color: Colors.pink[400],
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.pink[500]),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
