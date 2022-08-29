import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/domain/usecases/get_all_bestseller_phones_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'phone_list_event.dart';
part 'phone_list_state.dart';

class PhoneListBloc extends Bloc<PhoneListEvent, PhoneListState> {
  final GetAllBestsellerPhonesUsecase getAllBestsellerPhonesUsecase;

  PhoneListBloc({
    required this.getAllBestsellerPhonesUsecase,
  }) : super(PhoneListEmpty()) {
    on<PhoneListLoadingInitialized>(
      (event, emit) async {
        final prefs = await SharedPreferences.getInstance();
        bool? isFirstRun = prefs.getBool(Constants.isFirstRun);

        isFirstRun ??= true;
        emit(PhoneListLoading(isFirstTime: isFirstRun));

        final failureOrBestsellerPhones = await getAllBestsellerPhonesUsecase();
        await failureOrBestsellerPhones.fold(
          (error) async {
            await prefs.setBool(Constants.isFirstRun, isFirstRun!);
            emit(PhoneListError(message: _failureToErrorMessage(error)));
          },
          (phones) async {
            isFirstRun = false;
            await prefs.setBool(Constants.isFirstRun, false);
            emit(PhoneListLoaded(phones: phones));
          },
        );
      },
    );
  }

  String _failureToErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.serverFailureMessage;
      case CacheFailure:
        return Constants.cacheFailureMessage;
      default:
        return Constants.unexpectedFailureMessage;
    }
  }
}
