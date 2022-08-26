import 'package:effectivem_test/feature/data/models/phone_model.dart';

abstract class PhoneLocalDatasource {
  Future<List<PhoneModel>> getAllCachedPhones({required String prefsKey});
  Future<void> cachePhones(List<PhoneModel> phones, {required String prefsKey});
}
