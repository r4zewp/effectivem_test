import 'package:dio/dio.dart';
import 'package:effectivem_test/feature/core/dio/endpoints.dart';
import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/data/datasources/phone_remote_ds/phone_remote_ds.dart';
import 'package:effectivem_test/feature/data/models/phone_model.dart';

class PhoneRemoteDatasourceImpl extends PhoneRemoteDatasource {
  final Dio dio;

  PhoneRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<PhoneModel>> getAllBestSellerPhones() async =>
      _getPhonesFromApi('best_seller');

  @override
  Future<List<PhoneModel>> getAllHomeStorePhones() async =>
      _getPhonesFromApi('home_store');

  Future<List<PhoneModel>> _getPhonesFromApi(String phoneType) async {
    final response = await dio.get(Endpoints.getPhones);
    final responseStatusCode = response.statusCode;

    switch (responseStatusCode) {
      case 200:
        return (response.data[phoneType] as List)
            .map((e) => PhoneModel.fromJson(e))
            .toList();
      default:
        throw ServerException();
    }
  }
}
