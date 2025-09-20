import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:styla/core/resources/color_manager.dart';
import 'package:styla/core/resources/strings_manager.dart';
import 'package:styla/core/resources/styles_manager.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/features/home/data/models/filter_model/filter_model.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:styla/features/home/presentation/widgets/methods/filter/widgets/title_and_exit_button.dart';

Future<dynamic> filterModalBottomSheet(parentContext) {
  final allProductCubit = BlocProvider.of<AllProductCubit>(parentContext);
  List<FilterModel> filterCategoryList = [
    FilterModel(title: 'Price: Low - High'),
    FilterModel(title: 'Price: High - Low'),
  ];
  int? selectedIndex;
  return showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: parentContext,
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        child: SizedBox(
          height: MediaQuery.of(sheetContext).size.height * .3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAndExitButton(),
              const Divider(thickness: .7),
              Text(
                StringsManager.sortBy,
                style: StylesManager.textStyle16Sem(
                  ColorManager.primaryColor,
                ),
              ),
              const SizedBox(height: AppSize.s12),
              SizedBox(
                height: AppSize.s36,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filterCategoryList.length,
                      itemBuilder: (itemContext, index) {
                        final isSelected = selectedIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.p8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? ColorManager.black
                                    : ColorManager.white,
                                borderRadius: BorderRadius.circular(
                                  AppSize.s10,
                                ),
                                border: Border.all(
                                  color: ColorManager.lightGrey,
                                  width: AppSize.s1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p12,
                              ),
                              child: Center(
                                child: Text(
                                  filterCategoryList[index].title,
                                  style: StylesManager.textStyle16Med(
                                    isSelected
                                        ? ColorManager.white
                                        : ColorManager.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == 0) {
                      allProductCubit.sortByLowToHightPrice();
                    } else if (selectedIndex == 1) {
                      allProductCubit.sortByHighToLowPrice();
                    } else {
                      ScaffoldMessenger.of(parentContext).showSnackBar(
                        const SnackBar(
                          content: Text(StringsManager.plsSelectOneFilter),
                        ),
                      );
                    }
                    GoRouter.of(parentContext).pop();
                  },
                  child: const Text(StringsManager.applyFilter),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
