import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/core/platform/network.dart';
import 'package:effectivem_test/feature/data/datasources/phone_local_ds/phone_local_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_remote_ds/phone_remote_ds.dart';
import 'package:effectivem_test/feature/data/models/phone_model.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_repository.dart';

class PhoneRepositoryImpl extends PhoneRepository {
  final PhoneRemoteDatasource remoteDatasource;
  final PhoneLocalDatasource localDatasource;
  final NetworkConnection networkConnection;

  PhoneRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkConnection,
  });

  @override
  Future<Either<Failure, List<PhoneEntity>>> getAllBestSellerPhones() async =>
      _getPhones(() async => await remoteDatasource.getAllBestSellerPhones(),
          Constants.cachedBestSellerPhonesKey);

  @override
  Future<Either<Failure, List<PhoneEntity>>> getAllHomeStorePhones() async =>
      _getPhones(() async => await remoteDatasource.getAllHomeStorePhones(),
          Constants.cachedHomestorePhonesKey);

  Future<Either<Failure, List<PhoneEntity>>> _getPhones(
      Future<List<PhoneModel>> Function() getPhones, String prefsKey) async {
    if (await networkConnection.isConnected) {
      try {
        final phones = await remoteDatasource.getAllBestSellerPhones();

        localDatasource.cachePhones(
          phones,
          prefsKey: prefsKey,
        );

        return Right(phones);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhones =
            await localDatasource.getAllCachedPhones(prefsKey: prefsKey);
        return Right(localPhones);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
