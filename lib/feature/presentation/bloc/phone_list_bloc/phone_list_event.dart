part of 'phone_list_bloc.dart';

abstract class PhoneListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneListLoadingInitialized extends PhoneListEvent {}
