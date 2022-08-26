import 'package:effectivem_test/feature/data/models/phone_model.dart';

abstract class PhoneRemoteDatasource {
  Future<List<PhoneModel>> getAllHomeStorePhones();
  Future<List<PhoneModel>> getAllBestSellerPhones();
}
