import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/usecases/categories_usecase.dart';
import 'package:styla/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeUsecase) : super(CategoryInitial());
  final CategoriesUsecase homeUsecase;
  String selectedCategory = "All"; // Default
  List<CategoryEntity> _categories = []; // Store categories locally

  void changeCategory(String category, AllProductCubit productCubit) {
    print("🔄 Changing category from '$selectedCategory' to '$category'");
    selectedCategory = category;

    // Emit a state that includes both categories and selected category
    if (_categories.isNotEmpty) {
      emit(
        CategorySuccesse(
          categories: _categories,
          selectedCategory: selectedCategory,
        ),
      );
    } else {
      emit(CategorySelected(category: category));
    }

    print("✅ Emitted state for '$category'");
    productCubit.filterByCategory(category);
    print("✅ Called filterByCategory on AllProductCubit");
  }

  Future<void> getAllCategories() async {
    try {
      emit(CategoryLoading());
      var result = await homeUsecase.execute();
      result.fold(
        (failure) {
          print("❌ Category Error: $failure");
          emit(CategoryFailure(errorMessage: failure.message));
        },
        (categories) {
          print("✅ Categories Loaded: ${categories.length}");

          // to add All index in the first
          final List<CategoryEntity> updatedCategories = [
            CategoryEntity(categoryName: "All"),
            ...categories,
          ];

          // Store categories locally
          _categories = updatedCategories;

          print(
            "🔍 Available categories: ${updatedCategories.map((c) => c.categoryName).toList()}",
          );

          // Emit success state with selected category info
          emit(
            CategorySuccesse(
              categories: updatedCategories,
              selectedCategory: selectedCategory,
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      print("❌ Unexpected error in CategoryCubit: $e");
      print("Stack trace: $stackTrace");
      emit(CategoryFailure(errorMessage: "An unexpected error occurred"));
    }
  }
}
