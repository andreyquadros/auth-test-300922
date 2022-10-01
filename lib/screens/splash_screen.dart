import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'images/logo-ifro.png',
        nextScreen: HomeScreen(),
    splashTransition: SplashTransition.rotationTransition,
    );
  }
}
