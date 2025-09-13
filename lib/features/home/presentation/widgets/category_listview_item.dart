import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:styla/features/home/presentation/manager/category_cubit/category_cubit.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s4),
      child: InkWell(
        onTap: () {
          // print("🖱️ Category tapped: ${category.categoryName}");
          // change current category to selected category && filter the products
          context.read<CategoryCubit>().changeCategory(
            category.categoryName,
            context.read<AllProductCubit>(),
          );
        },
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccesse) {
              final isSelected =
                  state.selectedCategory == category.categoryName;
              // print(
              //   "🔍 Category '${category.categoryName}' isSelected: $isSelected (selectedCategory: '${state.selectedCategory}')",
              // );

              return Container(
                decoration: BoxDecoration(
                  color: isSelected ? ColorManager.black : ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  border: Border.all(
                    color: ColorManager.lightGrey,
                    width: AppSize.s1,
                  ),
                  // Add shadow for selected state
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: ColorManager.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                    vertical: AppPadding.p8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category.categoryName,
                        style: StylesManager.textStyle16Med(
                          isSelected
                              ? ColorManager.white
                              : ColorManager.primaryColor,
                        ),
                      ),
                      // if (isSelected) ...[
                      //   const SizedBox(width: 8),
                      //   Icon(
                      //     Icons.check_circle,
                      //     color: ColorManager.white,
                      //     size: 16,
                      //   ),
                      // ],
                    ],
                  ),
                ),
              );
            }

            // Fallback for other states
            return Container(
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s10),
                border: Border.all(
                  color: ColorManager.lightGrey,
                  width: AppSize.s1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p8,
                ),
                child: Text(
                  category.categoryName,
                  style: StylesManager.textStyle16Med(
                    ColorManager.primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
