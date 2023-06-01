import '../../../form_submission_status.dart';

class SignInState {
  final String username;
  // bool get isValidUsername => username.length > 3;
  bool get isValidUsername => true;

  final String password;
  // bool get isValidPassword => password.length > 6;
  bool get isValidPassword => true;

  final FormSubmissionStatus formStatus;

  SignInState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignInState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
