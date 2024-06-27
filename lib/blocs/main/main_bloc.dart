import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:contacts_bloc/domain/repository_v3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final repository = RepositoryV3();

  MainBloc() : super(MainStateInitial()) {
    on<LoadContactsEvent>((event, emit) async {
      try {
        print('LoadContactsEvent.load contacts event');
        emit(MainStateLoading());
        print('length: ${(await repository.getContacts()).length}');
        final contacts = await repository.getContacts();

        emit(MainStateLoaded(contacts));
      } catch (e) {
        emit(MainStateError("Failed to load contacts."));
      }
    });

    on<AddContactEvent>((event, emit) async {
      try {
        emit(MainStateLoading());
        await repository.addContact(event.contactData);
        emit(MainStateSuccess('Contact added successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to add todo.'));
      }
    });

    on<EditContactEvent>((event, emit) async {
      try {
        emit(MainStateLoading());
        await repository.updateContact(event.contactData);
        emit(MainStateSuccess('Contact updated successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to update todo.'));
      }
    });

    on<DeleteContact>((event, emit) async {
      try {
        emit(MainStateLoading());
        await repository.deleteContact(event.contactData);
        emit(MainStateSuccess('Contact deleted successfully.'));
      } catch (e) {
        emit(MainStateError('Failed to delete todo.'));
      }
    });
  }
}
