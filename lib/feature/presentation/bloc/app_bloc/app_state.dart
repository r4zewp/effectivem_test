part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppState {}

class AppErrorState extends AppState {}

class AppLoadedState extends AppState {}

class AppInitialState extends AppState {}
