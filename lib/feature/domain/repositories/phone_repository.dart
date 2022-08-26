import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';

abstract class PhoneRepository {
  Future<Either<Failure, List<PhoneEntity>>> getAllHomeStorePhones();
  Future<Either<Failure, List<PhoneEntity>>> getAllBestSellerPhones();
}
