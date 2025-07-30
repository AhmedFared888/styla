import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/no_param_use_case.dart';
import 'package:styla/features/home/domain/repos/home_repo.dart';

class AllproductsUsecase extends UseCase {
  final HomeRepo homeRepo;

  AllproductsUsecase(this.homeRepo);
  @override
  Future<Either<Failure, dynamic>> execute() {
    return homeRepo.getAllProducts();
  }
}
