import 'package:flutter/material.dart';

//firebase and provider
import 'package:firebase_core/firebase_core.dart';
import 'package:girlfriend_translator/features/information/data/data_sources/api/local_notifications.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

// local imports
import 'package:girlfriend_translator/core/util/app_providers.dart';
import 'package:girlfriend_translator/core/util/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initialNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: routes
      ),
    );
  }
}
