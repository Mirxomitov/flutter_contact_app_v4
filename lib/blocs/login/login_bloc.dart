import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository_v3.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.loading));

      final res = await RepositoryV3().login(event.email, event.password);
      res ? emit(state.copyWith(status: LoginStatus.success))
          : emit(
              state.copyWith(status: LoginStatus.failure),
            );
    });

    on<ToRegisterEvent>((event, emit) {
      emit(state.copyWith(toRegister: true));
      emit(state.copyWith(toRegister: false));
    });
  }
}
