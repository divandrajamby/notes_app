// ignore_for_file: import_of_legacy_library_into_null_safe, library_prefixes
import 'package:notesapp/helpers/helpers.dart';
import 'package:notesapp/ui/home/home.dart';
import 'package:notesapp/ui/login/login.dart';
import 'package:splashscreen/splashscreen.dart' as Splash;

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    //manggil fungsi yang berada di folder helpers
    bool user = await isUserLogin();
    setState(() {
      _isLogin = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Splash.SplashScreen(
      seconds: 3,
      navigateAfterSeconds: _isLogin ? const HomeScreen() : const LoginScreen(),
      title: const Text(
        'NotesApp',
        textScaleFactor: 2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      image: Image.asset('assets/notes.png'),
      photoSize: 100.0,
      // useLoader: false,
    );
  }
}
