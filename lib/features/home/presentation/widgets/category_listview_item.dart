import 'package:flutter/material.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          border: Border.all(color: ColorManager.lightGrey, width: AppSize.s1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p8,
          ),
          child: Text(
            'Tshirts',
            style: StylesManager.textStyle16Med(ColorManager.primaryColor),
          ),
        ),
      ),
    );
  }
}
