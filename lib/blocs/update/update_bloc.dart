import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:contacts_bloc/domain/repository_v4.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<UpdateContactEvent>((event, emit) async {
      emit(UpdateLoading());
      try {
        print('UpdateBloc.UpdateContactEvent.event.newContactData = ${event.newContactData}');
        print('UpdateBloc.UpdateContactEvent.event.oldContactData = ${event.oldContactData}');

        RepositoryV4().updateContact(newContact: event.newContactData, oldContact: event.oldContactData);
        emit(UpdateSuccess());
      } catch (e) {
        emit(UpdateFailure());
      }
    });
  }
}
