import 'package:effectivem_test/feature/domain/usecases/get_phone_extended_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_ext_event.dart';
part 'phone_ext_state.dart';

class PhoneExtListBloc extends Bloc<PhoneExtListEvent, PhoneExtListState> {
  final GetPhoneExtendedDetails getPhoneExtendedDetails;
  PhoneExtListBloc({required this.getPhoneExtendedDetails})
      : super(PhoneExtListEmpty());
}
