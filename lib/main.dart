import 'package:emailauth/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: "AIzaSyAkTT-gmqTVhbdv8JXVuQ54axBegsua3PA",
          appId: "1:197481658:web:f839e9f6464184b6109e83",
          messagingSenderId: "197481658",
          projectId: "emailauth-59e3e",
      )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Poll(),
    );
  }
}

