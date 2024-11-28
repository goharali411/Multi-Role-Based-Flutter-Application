import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/student_screen.dart';
import 'package:untitled/teacher_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final formData = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: 'Age',
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('Age', ageController.text.toString());

                  // admin,student,teacher
                  sp.setString('userType', 'Teacher');
                  sp.setBool('isLogin', true);
                  if (sp.getString('userType') == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentScreen()));
                  } else if (sp.getString('userType') == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeacherScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentScreen()));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text('Sign Up'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
