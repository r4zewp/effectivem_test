import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/core/usecase/usecase.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_repository.dart';

class GetAllBestsellerPhonesUsecase extends UseCase<List<PhoneEntity>> {
  PhoneRepository phoneRepository;

  GetAllBestsellerPhonesUsecase({required this.phoneRepository});

  @override
  Future<Either<Failure, List<PhoneEntity>>> call() async {
    return phoneRepository.getAllHomeStorePhones();
  }
}
