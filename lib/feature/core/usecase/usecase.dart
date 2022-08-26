import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
