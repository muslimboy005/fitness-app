import 'package:flutter/material.dart';
import 'package:flutter_86_vazifa/features/main/presentation/pages/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextPage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    nextPage(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 375,
          child: Image.asset(
            "assets/images/splash_image.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
