import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository_v4.dart';
import 'main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final repository = RepositoryV4();

  MainBloc() : super(MainStateInitial()) {
    on<LoadContactsEvent>((event, emit) {
      try {
        print('LoadContactsEvent.load contacts event');
        emit(MainStateLoading());
        print('length: ${(repository.getContacts()).length}');
        final contacts = repository.getContacts();

        emit(MainStateLoaded(contacts));
      } catch (e) {
        emit(MainStateError("Failed to load contacts."));
      }
    });

    on<AddContactEvent>((event, emit) {
      try {
        emit(MainStateLoading());
        repository.addContact(event.contactData);
        emit(MainStateSuccess('Contact added successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to add todo.'));
      }
    });

    on<EditContactEvent>((event, emit) async {
      try {
        emit(MainStateLoading());
        repository.updateContact(
          newContact: event.newContactData,
          oldContact: event.oldContactData,
        );
        emit(MainStateSuccess('Contact updated successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to update todo.'));
      }
    });

    on<DeleteContact>((event, emit) async {
      try {
        emit(MainStateLoading());
        repository.deleteContact(event.contactData);
        emit(MainStateSuccess('Contact deleted successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to delete todo.'));
      }
    });
  }
}
