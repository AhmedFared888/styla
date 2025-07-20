import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';

abstract class UseCase<type, params> {
  Future<Either<Failure, type>> execute(params params);
}
