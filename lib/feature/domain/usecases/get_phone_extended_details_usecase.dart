import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/core/usecase/usecase.dart';
import 'package:effectivem_test/feature/domain/entities/phone_extended_entity.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_extended_repository.dart';

class GetPhoneExtendedDetails extends UseCase<List<PhoneExtendedEntity>> {
  PhoneExtendedRepository phoneExtendedRepository;

  GetPhoneExtendedDetails({required this.phoneExtendedRepository});

  @override
  Future<Either<Failure, List<PhoneExtendedEntity>>> call() async {
    return phoneExtendedRepository.getPhoneExtendedDetails();
  }
}
