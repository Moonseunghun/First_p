// firebase_services.dart

import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}
