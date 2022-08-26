part of 'phone_list_hs_bloc.dart';

abstract class PhoneListHomestoreState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneListHomestoreEmpty extends PhoneListHomestoreState {}

class PhoneListHomestoreLoading extends PhoneListHomestoreState {}

class PhoneListHomestoreError extends PhoneListHomestoreState {
  final String message;

  PhoneListHomestoreError({required this.message});
}

class PhoneListHomestoreLoaded extends PhoneListHomestoreState {
  final List<PhoneEntity> phones;
  PhoneListHomestoreLoaded({required this.phones});
}
