import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/login_screen.dart';
import 'package:untitled/student_screen.dart';
import 'package:untitled/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        Timer(const Duration(seconds: 1), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else if(userType == 'teacher'){
        Timer(const Duration(seconds: 1), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
