import 'package:effectivem_test/feature/data/models/phone_extended_model.dart';

abstract class PhoneExtendedRemoteDatasource {
  Future<List<PhoneExtendedModel>> getPhoneExtendedDetails();
}
