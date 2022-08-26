part of 'phone_list_hs_bloc.dart';

abstract class PhoneListHomestoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneListHomeStoreLoadingInitialized extends PhoneListHomestoreEvent {}
