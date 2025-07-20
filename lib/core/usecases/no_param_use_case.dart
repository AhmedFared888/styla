import 'package:dartz/dartz.dart';
import 'package:styla/core/errors/failure.dart';

abstract class UseCase<type> {
  Future<Either<Failure, type>> execute();
}
