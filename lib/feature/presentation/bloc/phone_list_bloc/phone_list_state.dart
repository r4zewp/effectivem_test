part of 'phone_list_bloc.dart';

abstract class PhoneListState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneListEmpty extends PhoneListState {}

class PhoneListError extends PhoneListState {
  final String message;
  PhoneListError({required this.message});
}

class PhoneListLoading extends PhoneListState {
  final bool isFirstTime;

  PhoneListLoading({required this.isFirstTime});
}

class PhoneListLoaded extends PhoneListState {
  final List<PhoneEntity> phones;
  PhoneListLoaded({required this.phones});
}
