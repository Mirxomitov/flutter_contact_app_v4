part of 'delete_bloc.dart';

sealed class DeleteEvent {}

final class DeleteContactEvent extends DeleteEvent {
  final ContactDataFb contactDataFb;

  DeleteContactEvent(this.contactDataFb);
}
