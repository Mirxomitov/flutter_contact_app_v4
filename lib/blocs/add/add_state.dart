part of 'add_bloc.dart';

abstract class AddState {}

final class AddInitial extends AddState {}

final class AddLoading extends AddState {}

final class AddError extends AddState {
  final String message;

  AddError(this.message);
}

final class AddSuccess extends AddState {
  final String message;

  AddSuccess(this.message);
}