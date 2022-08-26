import 'dart:convert';

import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_local_ds/phone_extended_local_ds.dart';
import 'package:effectivem_test/feature/data/models/phone_extended_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneExtendedLocalDatasourceImpl extends PhoneExtendedLocalDatasource {
  final Future<SharedPreferences> preferences;

  PhoneExtendedLocalDatasourceImpl(this.preferences);

  @override
  Future<void> cacheExtendedPhones(
      List<PhoneExtendedModel> extendedPhones) async {
    final jsonedExtendedPhones = extendedPhones
        .map(
          (e) => jsonEncode(e.toJson()),
        )
        .toList();
    final awaitedPrefs = await preferences;
    awaitedPrefs.setStringList(
        Constants.cachedExtendedPhonesKey, jsonedExtendedPhones);
  }

  @override
  Future<List<PhoneExtendedModel>> getAllCachedExtendedPhones() async {
    final awaitedPrefs = await preferences;
    final cachedExtendedPhones =
        awaitedPrefs.getStringList(Constants.cachedExtendedPhonesKey);

    if (cachedExtendedPhones != null) {
      return Future.value(
        cachedExtendedPhones
            .map((e) => PhoneExtendedModel.fromJson(jsonDecode(e)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }
}
