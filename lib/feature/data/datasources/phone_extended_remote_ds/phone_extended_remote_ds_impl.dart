import 'package:dio/dio.dart';
import 'package:effectivem_test/feature/core/dio/endpoints.dart';
import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/data/models/phone_extended_model.dart';
import 'phone_extended_remote_ds.dart';

class PhoneExtendedRemoteDatasourceImpl extends PhoneExtendedRemoteDatasource {
  final Dio dio;

  PhoneExtendedRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<PhoneExtendedModel>> getPhoneExtendedDetails() async {
    final response = await dio.get(Endpoints.getExtendedPhones);
    final responseStatusCode = response.statusCode;

    switch (responseStatusCode) {
      case 200:
        return (response.data as List)
            .map((e) => PhoneExtendedModel.fromJson(e))
            .toList();
      default:
        throw ServerException();
    }
  }
}
