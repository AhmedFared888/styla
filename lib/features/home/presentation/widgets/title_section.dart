import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/routes_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          StringsManager.discover,
          style: StylesManager.textStyle32Sem(ColorManager.primaryColor),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RoutesManager.notificationRoute);
          },
          child: SvgPicture.asset(AssetsManager.notificationIcon),
        ),
        const SizedBox(width: AppSize.s8),
      ],
    );
  }
}
