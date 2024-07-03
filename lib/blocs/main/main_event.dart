part of 'main_bloc.dart';

abstract class MainEvent {}

final class AddContactEvent extends MainEvent {
  final ContactDataFb contactData;

  AddContactEvent({required this.contactData});
}

final class EditContactEvent extends MainEvent {
  final ContactDataFb newContactData;
  final ContactDataFb oldContactData;

  EditContactEvent({
    required this.newContactData,
    required this.oldContactData,
  });
}

final class DeleteContact extends MainEvent {
  final ContactDataFb contactData;

  DeleteContact(this.contactData);
}

final class LoadContactsEvent extends MainEvent {}

