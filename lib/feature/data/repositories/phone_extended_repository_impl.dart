import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/core/platform/network.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_local_ds/phone_extended_local_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_remote_ds/phone_extended_remote_ds.dart';
import 'package:effectivem_test/feature/domain/entities/phone_extended_entity.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_extended_repository.dart';

class PhoneExtendedRepositoryImpl extends PhoneExtendedRepository {
  final PhoneExtendedRemoteDatasource remoteDatasource;
  final PhoneExtendedLocalDatasource localDatasource;
  final NetworkConnection networkConnection;

  PhoneExtendedRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkConnection,
  });

  @override
  Future<Either<Failure, List<PhoneExtendedEntity>>>
      getPhoneExtendedDetails() async {
    if (await networkConnection.isConnected) {
      try {
        final result = await remoteDatasource.getPhoneExtendedDetails();
        localDatasource.cacheExtendedPhones(result);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final phones = await localDatasource.getAllCachedExtendedPhones();
        return Right(phones);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
