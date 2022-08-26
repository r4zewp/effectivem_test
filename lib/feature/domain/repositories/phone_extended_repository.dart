import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:effectivem_test/feature/domain/entities/phone_extended_entity.dart';

abstract class PhoneExtendedRepository {
  Future<Either<Failure, List<PhoneExtendedEntity>>> getPhoneExtendedDetails();
}
