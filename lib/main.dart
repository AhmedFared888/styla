import 'package:flutter/material.dart';
import 'package:styla/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Styla());
}

class Styla extends StatelessWidget {
  const Styla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
