import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class AgreeingText extends StatelessWidget {
  const AgreeingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              StringsManager.agreeingText,
              style: StylesManager.textStyle16Reg(ColorManager.primaryColor),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                StringsManager.terms,
                style: StylesManager.textStyle16Med(
                  ColorManager.primaryColor,
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                StringsManager.privacy,
                style: StylesManager.textStyle16Med(
                  ColorManager.primaryColor,
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                StringsManager.policy,
                style: StylesManager.textStyle16Med(
                  ColorManager.primaryColor,
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
            Text(
              StringsManager.and,
              style: StylesManager.textStyle16Reg(ColorManager.primaryColor),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                StringsManager.cookieUse,
                style: StylesManager.textStyle16Med(
                  ColorManager.primaryColor,
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
