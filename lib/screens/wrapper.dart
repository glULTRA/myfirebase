import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfiebase/models/user.dart';
import 'package:myfiebase/screens/authenticate/authenticate.dart';
import 'package:myfiebase/screens/authenticate/sign_in.dart';
import 'package:myfiebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    
    return user == null ? Authenticate() : Home();
  }
}
