import 'package:flutter/material.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/theme_manager.dart';

void main() {
  runApp(const Styla());
}

class Styla extends StatelessWidget {
  const Styla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.router,
      theme: getApptheme(),
    );
  }
}
