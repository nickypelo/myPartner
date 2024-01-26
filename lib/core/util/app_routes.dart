import 'package:flutter/cupertino.dart';

import '../../features/authentication/presentation/pages/register.dart';
import '../../features/authentication/presentation/pages/sign_in.dart';
import '../../features/information/presentation/pages/guy_home.dart';
import '../../features/information/presentation/pages/moreInfo.dart';


final routes = <String, WidgetBuilder>{
  '/': (context) => const GuyHome(),
  '/moreInfo': (context) => const MoreInfo(),
  '/register': (context) => const Register(),
  '/login': (context) => const SignIn(),
};
