import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfiebase/models/ult.dart';

class UltTile extends StatelessWidget {
  Ult ult = Ult(strength: 100);

  UltTile({required this.ult});

  @override
  Widget build(BuildContext context) {
    final int? test = ult.strength;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.pink[ult.strength!],
            backgroundImage: AssetImage("assets/fg.png"),
          ),
          title: Text(
            ult.name!,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Takes ${ult.sugars!} sugar(s)'),
        ),
      ),
    );
  }
}
