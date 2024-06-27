part of 'update_bloc.dart';

sealed class UpdateEvent {}

final class UpdateContactEvent extends UpdateEvent {
  final ContactDataFb contactDataFb;

  UpdateContactEvent(this.contactDataFb);
}
