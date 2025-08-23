import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/usecases/categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeUsecase) : super(CategoryInitial());
  final CategoriesUsecase homeUsecase;
  String selectedCategory = "All"; // Default

  void changeCategory(String category) {
    selectedCategory = category;
    emit(CategorySelected(category: category));
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
          emit(CategorySuccesse(categories: categories));
        },
      );
    } catch (e, stackTrace) {
      print("❌ Unexpected error in CategoryCubit: $e");
      print("Stack trace: $stackTrace");
      emit(CategoryFailure(errorMessage: "An unexpected error occurred"));
    }
  }
}
