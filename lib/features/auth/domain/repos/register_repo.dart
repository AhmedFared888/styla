import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/auth/domain/entities/user_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> register({
    required String fullName,
    required String email,
    required String password,
  });
}
