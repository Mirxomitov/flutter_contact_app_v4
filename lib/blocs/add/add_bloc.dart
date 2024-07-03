import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/firebase/contact_data_fb.dart';
import '../../domain/repository_v4.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final repository = RepositoryV4();

  AddBloc() : super(AddInitial()) {
    on<AddContactEvent>((event, emit) async {
      emit(AddLoading());
      try {
        print('AddBLoC.AddContactEvent.event.contactData = ${event.contactData}');
        await repository.addContact(event.contactData);
        emit(AddSuccess('Contact added successfully.'));
      } catch (e) {
        emit(AddError('Failed to add contact.'));
      }
    });
  }
}
