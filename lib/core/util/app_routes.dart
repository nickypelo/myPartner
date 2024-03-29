
import 'package:flutter/cupertino.dart';

import '../../features/authentication/presentation/pages/register.dart';
import '../../features/authentication/presentation/pages/sign_in.dart';
import '../../features/information/presentation/pages/mood_info.dart';
import '../../features/information/presentation/pages/moreInfo.dart';
import '../../features/information/presentation/pages/wrapper.dart';


final routes = <String, WidgetBuilder>{
  '/': (context) => const Wrapper(),
  '/moreInfo': (context) => const MoreInfo(),
  '/register': (context) => const Register(),
  '/login': (context) => const SignIn(),
  '/moodInfo': (context) => const MoodInfo()
};
