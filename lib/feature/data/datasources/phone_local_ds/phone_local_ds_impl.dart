import 'dart:convert';
import 'package:effectivem_test/feature/core/error/exception.dart';
import 'package:effectivem_test/feature/data/datasources/phone_local_ds/phone_local_ds.dart';
import 'package:effectivem_test/feature/data/models/phone_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneLocalDatasourceImpl extends PhoneLocalDatasource {
  final Future<SharedPreferences> preferences;

  PhoneLocalDatasourceImpl({required this.preferences});

  @override
  Future<void> cachePhones(List<PhoneModel> phones,
      {required String prefsKey}) async {
    final jsonedPhones = phones
        .map(
          (e) => jsonEncode(e.toJson()),
        )
        .toList();
    final awaitedPrefs = await preferences;
    awaitedPrefs.setStringList(prefsKey, jsonedPhones);
    debugPrint('**** CACHED');
  }

  @override
  Future<List<PhoneModel>> getAllCachedPhones(
      {required String prefsKey}) async {
    final awaitedPrefs = await preferences;
    final cachedPhones = awaitedPrefs.getStringList(prefsKey);

    if (cachedPhones != null) {
      return Future.value(
        cachedPhones.map((e) => PhoneModel.fromJson(jsonDecode(e))).toList(),
      );
    } else {
      return [];
    }
  }
}
