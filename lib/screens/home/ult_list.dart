import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfiebase/models/ult.dart';
import 'package:myfiebase/screens/home/ult_tile.dart';
import 'package:provider/provider.dart';

class UltList extends StatefulWidget {
  const UltList({Key? key}) : super(key: key);

  @override
  State<UltList> createState() => _UltListState();
}

class _UltListState extends State<UltList> {
  @override
  Widget build(BuildContext context) {
    print("test ?");
    final ults = Provider.of<List<Ult>?>(context) ?? [];
    ults.forEach((ult) {
      print(ult.name);
      print(ult.sugars);
      print(ult.strength);
    });
    int itemNum = ults.length;
    print("item: $itemNum");
    return ListView.builder(
      itemCount: itemNum,
      itemBuilder: (context, index) {
        return UltTile(ult: ults[index]);
      },
    );
  }
}
