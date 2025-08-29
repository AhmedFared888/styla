import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styla/core/resources/values_manager.dart';
import 'package:styla/core/widgets/custom_loading_indicator.dart';
import 'package:styla/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:styla/features/home/presentation/widgets/category_listview_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          print(
            "🔄 CategoryListView rebuilding with state: ${state.runtimeType}",
          );

          if (state is CategorySuccesse) {
            print(
              "✅ CategoryListView: Success state with ${state.categories.length} categories, selected: '${state.selectedCategory}'",
            );
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
            print(
              "❌ CategoryListView: Failure state with error: ${state.errorMessage}",
            );
            return Center(child: Text(state.errorMessage));
          } else {
            print("⏳ CategoryListView: Loading/Initial state");
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
