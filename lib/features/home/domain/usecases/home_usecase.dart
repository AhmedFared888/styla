import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/no_param_use_case.dart';
import 'package:styla/features/home/domain/repos/home_repo.dart';

class HomeUsecase extends UseCase {
  final HomeRepo homeRepo;

  HomeUsecase(this.homeRepo);
  @override
  Future<Either<Failure, dynamic>> execute() async {
    // if I want to check permssion or any code I want to do here
    return await homeRepo.getAllCategory();
  }
}
