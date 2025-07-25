import 'package:flutter/material.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.network(
                'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
              ),
              Positioned(
                right: AppSize.s12,
                top: AppSize.s12,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Image.asset(AssetsManager.favorite),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Regular Fit Slogan',
              style: StylesManager.textStyle16Sem(ColorManager.primaryColor),
            ),
            Row(
              children: [
                Text(
                  '\$ 1,190',
                  style: StylesManager.textStyle12Med(
                    ColorManager.primaryColor,
                  ),
                ),
                Text(
                  '  -52%',
                  style: StylesManager.textStyle12Med(ColorManager.error),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
