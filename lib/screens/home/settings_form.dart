// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfiebase/models/user.dart';
import 'package:myfiebase/services/database.dart';
import 'package:myfiebase/shared/constants.dart';
import 'package:myfiebase/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(
      stream: DataBaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData user_data = snapshot.data!;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Update your ULT Settings",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: user_data.name,
                  decoration: textInputDecoration.copyWith(
                    hintText: "Name",
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.pink,
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter a name" : null,
                  onChanged: (value) => setState(() => _currentName = value),
                ),
                SizedBox(height: 20.0),

                // Drop down
                DropdownButtonFormField(
                  value: _currentSugars ?? user_data.sugars,
                  items: sugars
                      .map((sugar) => DropdownMenuItem(
                            value: sugar,
                            child: Text("$sugar sugars"),
                            enabled: true,
                          ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _currentSugars = value.toString()),
                ),
                Slider(
                  min: 100,
                  max: 900,
                  divisions: 8,
                  value: (_currentStrength ?? user_data.strength!).toDouble(),
                  activeColor:
                      Colors.pink[_currentStrength ?? user_data.strength!],
                  inactiveColor:
                      Colors.pink[_currentStrength ?? user_data.strength!],
                  onChanged: (value) =>
                      setState(() => _currentStrength = value.round()),
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DataBaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? user_data.sugars!,
                        _currentName ?? user_data.name!,
                        _currentStrength ?? user_data.strength!,
                      );
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.pink[400],
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
