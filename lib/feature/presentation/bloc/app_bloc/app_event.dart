part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitialized extends AppEvent {}
