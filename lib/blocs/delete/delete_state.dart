part of 'delete_bloc.dart';

sealed class DeleteState {
}

final class DeleteInitial extends DeleteState {}

final class DeleteSuccess extends DeleteState {}

final class DeleteFailure extends DeleteState {}

final class DeleteLoading extends DeleteState {}
