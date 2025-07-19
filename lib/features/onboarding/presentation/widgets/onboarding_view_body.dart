import 'package:flutter/material.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

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
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(StringsManager.onboardingButton),
                        const SizedBox(width: AppSize.s10),
                        const Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
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
