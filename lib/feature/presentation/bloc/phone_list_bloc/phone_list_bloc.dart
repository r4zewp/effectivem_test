import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/error/failure.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/domain/usecases/get_all_bestseller_phones_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_list_event.dart';
part 'phone_list_state.dart';

class PhoneListBloc extends Bloc<PhoneListEvent, PhoneListState> {
  final GetAllBestsellerPhonesUsecase getAllBestsellerPhonesUsecase;

  PhoneListBloc({
    required this.getAllBestsellerPhonesUsecase,
  }) : super(PhoneListEmpty()) {
    on<PhoneListLoadingInitialized>(
      (event, emit) async {
        emit(PhoneListLoading());
        final failureOrBestsellerPhones = await getAllBestsellerPhonesUsecase();

        failureOrBestsellerPhones.fold(
          (error) => emit(
            PhoneListError(message: _failureToErrorMessage(error)),
          ),
          (phones) => emit(
            PhoneListLoaded(phones: phones),
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
