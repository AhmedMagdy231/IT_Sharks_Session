part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class GetDataLoading extends AppState{}

class GetDataSuccess extends AppState{}

class GetDataError extends AppState{}

class ChangeFinish extends AppState{}
