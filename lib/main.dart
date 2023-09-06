import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Firebase 회원 가입 예제
            try {
              UserCredential userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: 'user@example.com',
                password: 'password',
              );

              // Firebase 데이터 저장 예제
              await _firestore
                  .collection('users')
                  .doc(userCredential.user!.uid)
                  .set({
                'name': 'John Doe',
                'age': 30,
              });

              // 회원 가입 성공 시 어떤 작업을 수행할 수 있습니다.
              // 예: 화면 전환 또는 메시지 표시
            } catch (e) {
              // 회원 가입 실패 시 에러 처리
              print('Error: $e');
            }
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
