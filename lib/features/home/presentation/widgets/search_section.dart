import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styla/core/resources/assets_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_text_form_feild.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            onChanged: context.read<AllProductCubit>().searchFunction,
            hintText: StringsManager.searchForClothes,
            prefixIcon: SvgPicture.asset(
              AssetsManager.search,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const SizedBox(width: AppSize.s8),
        SvgPicture.asset(
          AssetsManager.filterButton,
          width: AppSize.s45,
          height: AppSize.s45,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
