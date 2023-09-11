import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:my_firebase_app/authentication_screen.dart';

import 'authentication_screen.dart';
import 'firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationScreen(),
    );
  }
}
