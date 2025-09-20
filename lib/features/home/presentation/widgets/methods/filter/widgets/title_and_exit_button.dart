import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';

class TitleAndExitButton extends StatelessWidget {
  const TitleAndExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          StringsManager.filter,
          style: StylesManager.textStyle20Sem(
            ColorManager.primaryColor,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(CupertinoIcons.xmark),
        ),
      ],
    );
  }
}
