import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1, color: ColorManager.lightGrey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
          child: Text(
            'Or',
            style: StylesManager.textStyle14Reg(ColorManager.lightGrey),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 1, color: ColorManager.lightGrey),
        ),
      ],
    );
  }
}
