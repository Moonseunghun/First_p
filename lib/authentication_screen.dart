// authentication_screen.dart

import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 회원가입 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: const Text('회원가입'),
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
