// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfiebase/models/ult.dart';
import 'package:myfiebase/screens/home/settings_form.dart';
import 'package:myfiebase/screens/home/ult_list.dart';
import 'package:myfiebase/services/auth.dart';
import 'package:myfiebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        },
      );
    }

    return StreamProvider<List<Ult>?>.value(
      initialData: [],
      catchError: (_, __) => null,
      value: DataBaseService().ults,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          elevation: 0.0,
          title: const Text('Home'),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.grey[50],
              ),
              label: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 15,
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.grey[50],
              ),
              label: Text(
                "setting",
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: UltList(),
        ),
      ),
    );
  }
}
