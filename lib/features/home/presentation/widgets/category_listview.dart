import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/utils/functions/service_locator.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/features/home/domain/usecases/categories_usecase.dart';
import 'package:styla/features/home/presentation/manager/cubit/category_cubit.dart';
import 'package:styla/features/home/presentation/widgets/category_listview_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<CategoriesUsecase>())..getAllCategories(),
      child: SizedBox(
        height: AppSize.s40,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccesse) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryListViewItem(
                    category: state.categories[index],
                  );
                },
                itemCount: state.categories.length,
              );
            } else if (state is CategoryFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
