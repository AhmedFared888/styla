import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(right: AppPadding.p24),
      child: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          StringsManager.savedItems,
          style: StylesManager.textStyle24Sem(ColorManager.primaryColor),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(AssetsManager.notificationIcon),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
