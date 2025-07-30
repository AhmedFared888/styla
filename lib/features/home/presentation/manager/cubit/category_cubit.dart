import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:styla/features/home/domain/entities/category_entity.dart';
import 'package:styla/features/home/domain/usecases/home_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeUsecase) : super(CategoryInitial());
  final HomeUsecase homeUsecase;

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    var result = await homeUsecase.execute();
    result.fold(
      (failure) => emit(CategoryFailure(errorMessage: failure.message)),
      (categories) => emit(CategorySuccesse(categories: categories)),
    );
  }
}
