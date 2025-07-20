import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/use_case.dart';
import 'package:styla/features/auth/register/domain/entities/register_entity.dart';
import 'package:styla/features/auth/register/domain/params/register_params.dart';
import 'package:styla/features/auth/register/domain/repos/register_repo.dart';

class RegisterUsecase extends UseCase<RegisterEntity, RegisterParams> {
  final RegisterRepo registerRepo;

  RegisterUsecase(this.registerRepo);

  @override
  Future<Either<Failure, RegisterEntity>> execute(RegisterParams params) {
    return registerRepo.register(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}
