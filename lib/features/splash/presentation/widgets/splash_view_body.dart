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
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s10),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(AssetsManager.splashCurve),
                    Positioned(
                      bottom: AppSize.s300,
                      left: 0,
                      right: 0,
                      child: Image.asset(AssetsManager.appLogo),
                    ),
                    const Positioned(
                      bottom: AppSize.s66,
                      left: 0,
                      right: 0,
                      child: CustomLoadingIndicator(),
                    ),
                  ],
                ),
              ),
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
