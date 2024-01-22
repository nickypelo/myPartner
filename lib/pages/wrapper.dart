import 'package:flutter/material.dart';
import 'package:girlfriend_translator/pages/authenticate/authenticate.dart';
import 'package:girlfriend_translator/pages/authenticate/sign_in.dart';
import 'package:girlfriend_translator/pages/home.dart';
import 'package:girlfriend_translator/pages/moreInfo.dart';
import 'package:provider/provider.dart';

// local imports
import '../model/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    print(user);

    if(user == null) {
      return SignIn();
    }else{
      return HomePage();
    }
  }
}
