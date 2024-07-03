part of 'update_bloc.dart';

sealed class UpdateEvent {}

final class UpdateContactEvent extends UpdateEvent {
  final ContactDataFb newContactData;
  final ContactDataFb oldContactData;

  UpdateContactEvent({required this.newContactData, required this.oldContactData});
}
