import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';
import 'package:styla/features/auth/register/domain/entities/register_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterEntity>> register({
    required String fullName,
    required String email,
    required String password,
  });
}
