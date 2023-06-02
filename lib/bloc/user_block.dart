import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoggedIn(user: event.user));
    });

    on<UserLogoutEvent>((event, emit) async {
      emit(UserInitial());
    });
  }
}
