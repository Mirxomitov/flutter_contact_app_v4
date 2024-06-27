import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository_v3.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteContactEvent>((event, emit) async {
      emit(DeleteLoading());
      try {
        print('delete data in bloc: ${event.contactDataFb}');
        await RepositoryV3().deleteContact(event.contactDataFb);
        emit(DeleteSuccess());
      } catch (e) {
        emit(DeleteFailure());
      }
    });
  }
}
