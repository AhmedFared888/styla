import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          StringsManager.forgotYourPassword,
          style: StylesManager.textStyle16Reg(ColorManager.primaryColor),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RoutesManager.forgetPasswordRoute);
          },
          child: Text(
            StringsManager.resetYourPassword,
            style: StylesManager.textStyle16Med(
              ColorManager.primaryColor,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
