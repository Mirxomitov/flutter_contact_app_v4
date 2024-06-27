import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:contacts_bloc/domain/repository_v2.dart';
import 'package:contacts_bloc/domain/repository_v3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<UpdateContactEvent>((event, emit) async {
      emit(UpdateLoading());
      try {
        print('UpdateBloc.UpdateContactEvent.event.contactDataFb = ${event.contactDataFb}');

        await RepositoryV3().updateContact(event.contactDataFb);
        emit(UpdateSuccess());
      } catch (e) {
        emit(UpdateFailure());
      }
    });
  }
}
