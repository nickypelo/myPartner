import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/presentation/pages/sign_in.dart';
import 'package:provider/provider.dart';

// local imports
import '../../../authentication/data/models/user.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    print(user);

    if(user == null) {
      return const SignIn();
    }else{
      return const HomePage();
    }
  }
}
