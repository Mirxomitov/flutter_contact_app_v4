part of 'main_bloc.dart';

abstract class MainEvent {}

final class AddContactEvent extends MainEvent {
  final ContactDataFb contactData;

  AddContactEvent({required this.contactData});
}

final class EditContactEvent extends MainEvent {
  final ContactDataFb contactData;

  EditContactEvent({required this.contactData});
}

final class DeleteContact extends MainEvent {
  final ContactDataFb contactData;

  DeleteContact(this.contactData);
}

final class LoadContactsEvent extends MainEvent {}

