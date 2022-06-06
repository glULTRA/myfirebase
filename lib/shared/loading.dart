import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Container(
        child: Center(
          child: SpinKitSpinningLines(
            color: Colors.black,
            duration: Duration(seconds: 5),
          ),
        ),
      ),
    );
  }
}
