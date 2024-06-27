part of 'update_bloc.dart';

sealed class UpdateState {
}

final class UpdateInitial extends UpdateState {}

final class UpdateSuccess extends UpdateState {}

final class UpdateFailure extends UpdateState {}

final class UpdateLoading extends UpdateState {}
