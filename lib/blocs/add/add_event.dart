part of 'add_bloc.dart';

sealed class AddEvent {}

final class AddContactEvent extends AddEvent {
  final ContactDataFb contactData;

  AddContactEvent({required this.contactData});
}