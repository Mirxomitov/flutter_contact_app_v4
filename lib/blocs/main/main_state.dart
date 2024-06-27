import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:contacts_bloc/domain/repository_v2.dart';
import 'package:equatable/equatable.dart';
class MainState {}

class MainStateInitial extends MainState {}

class MainStateLoading extends MainState {}

class MainStateLoaded extends MainState {
  final List<ContactDataFb> contacts;

  MainStateLoaded(this.contacts);
}

class MainStateError extends MainState {
  final String message;

  MainStateError(this.message);
}

class MainStateSuccess extends MainState {
  final String message;

  MainStateSuccess(this.message);
}