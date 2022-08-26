import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/domain/usecases/get_all_homestore_phones_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_list_hs_event.dart';
part 'phone_list_hs_state.dart';

class PhoneListHomestoreBloc
    extends Bloc<PhoneListHomestoreEvent, PhoneListHomestoreState> {
  final GetAllHomeStorePhonesUsecase getAllHomeStorePhonesUsecase;
  PhoneListHomestoreBloc({required this.getAllHomeStorePhonesUsecase})
      : super(PhoneListHomestoreEmpty()) {
    on<PhoneListHomeStoreLoadingInitialized>(
      (event, emit) async {
        emit(PhoneListHomestoreLoading());
        final failureOrHomestorePhones = await getAllHomeStorePhonesUsecase();

        failureOrHomestorePhones.fold(
          (error) => emit(
            PhoneListHomestoreError(message: _failureToErrorMessage(error)),
          ),
          (phones) => emit(
            PhoneListHomestoreLoaded(phones: phones),
          ),
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
