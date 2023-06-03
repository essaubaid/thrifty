import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/models/user_model.dart';
import 'package:thrifty/repository/auth_repo.dart';
import 'package:thrifty/repository/user_repo.dart';
import 'package:thrifty/screens/sign_in/bloc/sign_in_event.dart';
import 'package:thrifty/screens/sign_in/bloc/sign_in_state.dart';

import '../../../bloc/user_block.dart';
import '../../../bloc/user_event.dart';
import '../../../form_submission_status.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepo;
  final UserBloc userBloc;
  final UserRepository userRepo = UserRepository();
  SignInBloc({
    required this.authRepo,
    required this.userBloc,
  }) : super(SignInState()) {
    // Handle SignInUsernameChanged event
    on<SignInUsernameChanged>((event, emit) async {
      emit(state.copyWith(username: event.username));
    });

    // Handle SignInPasswordChanged event
    on<SignInPasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password));
    });

    // Handle FormReset event
    on<FormReset>((event, emit) async {
      emit(state.copyWith(formStatus: const InitialFormStatus()));
    });

    on<SignInWithGoogle>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        UserModel user = await authRepo.signInWithGoogle();
        userBloc.add(UserLoginEvent(user: user));
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });

    // Handle SignInSubmitted event
    on<SignInSubmitted>(handleSignInSubmitted);
  }

  // A separate function to handle SignInSubmitted events, because this
  // involves some more complex logic.
  Future<void> handleSignInSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try {
      UserModel? user = await authRepo.login(
        emailAddress: state.username,
        password: state.password,
      );
      UserModel userFromRepo = await userRepo.getUserData(user!.id);
      userBloc.add(UserLoginEvent(user: userFromRepo));
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
