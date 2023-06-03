import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_block.dart';
import '../../../bloc/user_event.dart';
import '../../../form_submission_status.dart';
import '../../../models/user_model.dart';
import '../../../repository/auth_repo.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  final UserBloc userBloc;

  SignUpBloc({
    required this.authRepo,
    required this.userBloc,
  }) : super(SignUpState()) {
    on<SignUpEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<SignUpPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignUpDisplayNameChanged>((event, emit) {
      emit(state.copyWith(displayName: event.displayName));
    });

    on<SignUpIsObscureChanged>((event, emit) {
      emit(state.copyWith(isObscure: event.isObscure));
    });

    on<SignUpSubmitted>(signInSubmitted);

    on<FormReset>((event, emit) {
      emit(state.copyWith(formStatus: const InitialFormStatus()));
    });
  }

  Future signInSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try {
      UserModel user = await authRepo.signUp(
        email: state.email,
        password: state.password,
        displayName: state.displayName,
      );
      userBloc.add(UserLoginEvent(user: user));
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
