import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSignUp = false;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

      if (_isSignUp) {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? '회원가입' : '로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '이메일'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '비밀번호'),
              obscureText: true, // 비밀번호를 가림
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text(_isSignUp ? '회원가입' : '로그인'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignUp = !_isSignUp; // 모드 전환
                });
              },
              child: Text(_isSignUp ? '이미 계정이 있으신가요? 로그인' : '계정이 없으신가요? 회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
