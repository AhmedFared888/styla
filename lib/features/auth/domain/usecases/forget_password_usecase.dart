import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/core/usecases/use_case.dart';
import 'package:styla/features/auth/domain/entities/user_entity.dart';
import 'package:styla/features/auth/domain/params/forget_password_params.dart';
import 'package:styla/features/auth/domain/repos/auth_repo.dart';

class ForgetPasswordUsecase extends UseCase<UserEntity, ForgetPasswordParams> {
  final AuthRepo authRepo;

  ForgetPasswordUsecase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> execute(ForgetPasswordParams params) {
    return authRepo.forgetPassword(email: params.email);
  }
}
