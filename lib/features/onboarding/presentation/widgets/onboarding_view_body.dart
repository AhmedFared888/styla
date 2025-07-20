import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_elevated_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p24),
                      child: Text(
                        StringsManager.onboardingTitle,
                        style: StylesManager.textStyle64Sem(
                          ColorManager.primaryColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppSize.s170,
                      child: Image.asset(AssetsManager.onboardingCurve),
                    ),
                    Positioned(
                      left: AppSize.s55,
                      top: AppSize.s90,
                      child: Image.asset(
                        AssetsManager.onboardingPerson,
                        width: AppSize.s358,
                        height: AppSize.s697,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
                child: CustomElevatedButton(
                  title: StringsManager.onboardingButton,
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(RoutesManager.registerRoute);
                  },
                ),
              ),
              const SizedBox(height: AppSize.s20),
            ],
          ),
        ),
      ),
    );
  }
}
