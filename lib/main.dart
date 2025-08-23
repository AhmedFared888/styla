import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:styla/constants.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/theme_manager.dart';
import 'package:styla/core/utils/functions/service_locator.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/entities/product_entity/product_entity.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    print("🚀 Initializing Flutter app...");

    await Firebase.initializeApp();
    print("✅ Firebase initialized");

    await Hive.initFlutter();
    print("✅ Hive initialized");

    Hive.registerAdapter(CategoryEntityAdapter());
    Hive.registerAdapter(ProductEntityAdapter());
    print("✅ Hive adapters registered");

    await Hive.openBox<CategoryEntity>(kCategoryBox);
    await Hive.openBox<ProductEntity>(kProductBox);
    print("✅ Hive boxes opened");

    setupServiceLocator();
    print("✅ Service locator setup complete");

    runApp(const Styla());
    print("✅ App started successfully");
  } catch (e, stackTrace) {
    print("❌ Fatal error during app initialization: $e");
    print("Stack trace: $stackTrace");
    // Re-throw to show Flutter's error screen
    rethrow;
  }
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
