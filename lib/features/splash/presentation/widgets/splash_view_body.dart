import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: Center(
          child: Column(
            children: [
              Image.asset(AssetsManager.splashCurve),
              Image.asset(AssetsManager.appLogo),
              const SizedBox(height: AppSize.s200),
              const CustomLoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(RoutesManager.onBoardingRoute);
    });
  }
}
