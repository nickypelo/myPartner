import 'package:flutter/material.dart';

//firebase and provider
import 'package:firebase_core/firebase_core.dart';
import 'core/util/app_providers.dart';
import 'core/util/app_routes.dart';
import 'features/information/data/data_sources/api/local_notifications.dart';
import 'features/information/data/data_sources/apo_firebase.dart';
import 'firebase_options.dart';

// local imports


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initialNotification();
  await FirebaseApi().initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProviders(
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
