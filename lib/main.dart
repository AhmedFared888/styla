import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/theme_manager.dart';
import 'package:styla/core/utils/functions/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupServiceLocator();

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
