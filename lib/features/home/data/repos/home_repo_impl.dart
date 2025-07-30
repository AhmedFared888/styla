import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/home/data/data_sources/home_local_data_source.dart';
import 'package:styla/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:styla/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:styla/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory() async {
    try {
      var categoryLocal = homeLocalDataSource.getAllCategory();
      if (categoryLocal.isNotEmpty) {
        return right(categoryLocal);
      }
      var categories = await homeRemoteDataSource.getAllCategory();
      return right(categories);
    } catch (e, s) {
      print(e);
      print(s);
      if (e is DioException) {
        return left(ServerFailre.fromDioException(e));
      } else {
        return left(ServerFailre(e.toString()));
      }
    }
  }
}
