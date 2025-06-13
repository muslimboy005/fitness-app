import 'package:flutter/material.dart';
import 'package:flutter_86_vazifa/features/main/data/datasource/auth_datasource.dart';
import 'package:flutter_86_vazifa/features/main/presentation/pages/login_screen.dart';
import 'package:flutter_86_vazifa/features/main/presentation/pages/permission_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() =>
      _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  final datasource = AuthDataSourceImpl();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/gym_hall.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "email",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Iltimos, ma'lumot kiriting";
                              }
                              if (!value
                                  .contains('@gmail.com')) {
                                return "Iltimos, email kiriting";
                              }
                              if (value.length < 6) {
                                return "Iltimos, to'g'ri email kiriting";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Iltimos, parol kiriting";
                              }
                              if (value.length < 6) {
                                return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20),
                        child: InkWell(
                          onTap: () async {
                            if (key.currentState!
                                .validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              final user = await datasource
                                  .createUserWithEmailAndPassword(
                                      emailController.text,
                                      passwordController
                                          .text);
                              setState(() {
                                isLoading = false;
                              });
                              if (user.user != null) {
                                if (context.mounted) {
                                  Navigator
                                      .pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    PermissionScreen(),
                                          ), (_) {
                                    return false;
                                  });
                                }
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: isLoading
                                  ? CircularProgressIndicator
                                      .adaptive()
                                  : Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xffF41671),
                            padding: EdgeInsets.symmetric(
                                vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30),
                            ),
                          ),
                          icon: Icon(Icons.email),
                          label: Text(
                            "SIGN UP WITH EMAIL",
                            style: TextStyle(
                                fontWeight:
                                    FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                              Icons.facebook, Colors.blue),
                          SizedBox(width: 20),
                          _buildSocialButton(
                              Icons.g_mobiledata,
                              Colors.red),
                          SizedBox(width: 20),
                          _buildSocialButton(Icons.apple,
                              Colors.grey[800]!),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.white),
                            children: [
                              TextSpan(
                                  text:
                                      "Already have an account? "),
                              TextSpan(
                                text: "Log in",
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}
