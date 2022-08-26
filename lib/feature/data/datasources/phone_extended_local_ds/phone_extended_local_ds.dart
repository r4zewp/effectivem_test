import 'package:effectivem_test/feature/data/models/phone_extended_model.dart';

abstract class PhoneExtendedLocalDatasource {
  Future<void> cacheExtendedPhones(List<PhoneExtendedModel> extendedPhones);
  Future<List<PhoneExtendedModel>> getAllCachedExtendedPhones();
}
