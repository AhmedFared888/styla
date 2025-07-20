import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.iconImage,
    required this.title,
  });

  final void Function()? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final String iconImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        side: const BorderSide(color: ColorManager.lightGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconImage),
            const SizedBox(width: AppSize.s10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
