part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccesse extends CategoryState {
  final List<CategoryEntity> categories;

  CategorySuccesse({required this.categories});
}

final class CategorySelected extends CategoryState {
  final String category;

  CategorySelected({required this.category});
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;

  CategoryFailure({required this.errorMessage});
}
