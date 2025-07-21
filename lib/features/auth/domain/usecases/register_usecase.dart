import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/use_case.dart';
import 'package:styla/features/auth/domain/entities/user_entity.dart';
import 'package:styla/features/auth/domain/params/register_params.dart';
import 'package:styla/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase extends UseCase<UserEntity, RegisterParams> {
  final AuthRepo authRepo;

  RegisterUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> execute(RegisterParams params) {
    return authRepo.register(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}
