import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_text_form_feild.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomTextFormField(hintText: StringsManager.searchForClothes),
        ),
        const SizedBox(width: AppSize.s8),
        SvgPicture.asset(AssetsManager.filterButton),
      ],
    );
  }
}
