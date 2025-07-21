import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/use_case.dart';
import 'package:styla/features/auth/domain/entities/user_entity.dart';
import 'package:styla/features/auth/domain/params/login_params.dart';
import 'package:styla/features/auth/domain/repos/auth_repo.dart';

class LoginUsecase extends UseCase<UserEntity, LoginParams> {
  final AuthRepo authRepo;

  LoginUsecase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> execute(params) {
    return authRepo.login(email: params.email, password: params.password);
  }
}
