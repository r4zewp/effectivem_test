import 'package:effectivem_test/feature/core/dio/dio_singleton.dart';
import 'package:effectivem_test/feature/core/platform/network.dart';
import 'package:effectivem_test/feature/core/platform/network_impl.dart';
import 'package:effectivem_test/feature/core/usecase/usecase.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_local_ds/phone_extended_local_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_local_ds/phone_extended_local_ds_impl.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_remote_ds/phone_extended_remote_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_extended_remote_ds/phone_extended_remote_ds_impl.dart';
import 'package:effectivem_test/feature/data/datasources/phone_local_ds/phone_local_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_local_ds/phone_local_ds_impl.dart';
import 'package:effectivem_test/feature/data/datasources/phone_remote_ds/phone_remote_ds.dart';
import 'package:effectivem_test/feature/data/datasources/phone_remote_ds/phone_remote_ds_impl.dart';
import 'package:effectivem_test/feature/data/repositories/phone_extended_repository_impl.dart';
import 'package:effectivem_test/feature/data/repositories/phone_repository_impl.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_extended_repository.dart';
import 'package:effectivem_test/feature/domain/repositories/phone_repository.dart';
import 'package:effectivem_test/feature/domain/usecases/get_all_bestseller_phones_usecase.dart';
import 'package:effectivem_test/feature/domain/usecases/get_all_homestore_phones_usecase.dart';
import 'package:effectivem_test/feature/domain/usecases/get_phone_extended_details_usecase.dart';
import 'package:effectivem_test/feature/presentation/bloc/app_bloc/app_bloc.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_bloc/phone_list_bloc.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_hs_bloc/phone_list_hs_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  /// BLoC
  locator.registerFactory(
      () => PhoneListBloc(getAllBestsellerPhonesUsecase: locator()));
  locator.registerFactory(
      () => PhoneListHomestoreBloc(getAllHomeStorePhonesUsecase: locator()));
  locator.registerFactory(() => AppBloc());

  /// Usecases
  locator.registerLazySingleton(
      () => GetAllBestsellerPhonesUsecase(phoneRepository: locator()));
  locator.registerLazySingleton(
      () => GetAllHomeStorePhonesUsecase(phoneRepository: locator()));
  locator.registerLazySingleton(
      () => GetPhoneExtendedDetails(phoneExtendedRepository: locator()));

  /// Repository
  locator.registerLazySingleton<PhoneRepository>(
    () => PhoneRepositoryImpl(
      remoteDatasource: locator(),
      localDatasource: locator(),
      networkConnection: locator(),
    ),
  );

  locator.registerLazySingleton<PhoneExtendedRepository>(
    () => PhoneExtendedRepositoryImpl(
      remoteDatasource: locator(),
      localDatasource: locator(),
      networkConnection: locator(),
    ),
  );

  locator.registerLazySingleton<PhoneRemoteDatasource>(
      () => PhoneRemoteDatasourceImpl(dio: DioSingleton().instance()));

  locator.registerLazySingleton<PhoneExtendedRemoteDatasource>(
      () => PhoneExtendedRemoteDatasourceImpl(dio: DioSingleton().instance()));

  locator.registerLazySingleton<PhoneLocalDatasource>(() =>
      PhoneLocalDatasourceImpl(preferences: SharedPreferences.getInstance()));

  locator.registerLazySingleton<PhoneExtendedLocalDatasource>(
      () => PhoneExtendedLocalDatasourceImpl(SharedPreferences.getInstance()));

  /// Core
  locator.registerLazySingleton<NetworkConnection>(() => NetworkConnectionImpl(
        locator(),
      ));

  /// External
  locator.registerLazySingleton(() => SharedPreferences.getInstance());
  locator.registerLazySingleton(() => DioSingleton().instance());
  locator.registerLazySingleton(() => InternetConnectionChecker());
}
