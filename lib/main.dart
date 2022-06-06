import 'package:flutter/material.dart';
import 'package:myfiebase/models/user.dart';
import 'package:myfiebase/screens/wrapper.dart';
import 'package:myfiebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: FirebaseOptions(
      //  apiKey: "XXX",
      //  appId: "XXX",
      //  messagingSenderId: "XXX",
      //  projectId: "XXX",
      //),
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
