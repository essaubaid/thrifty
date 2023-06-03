import '../../../form_submission_status.dart';

class SignUpState {
  final String email;
  bool get isValidEmail => true;

  final String password;
  bool get isValidPassword => true;

  final String displayName;
  bool get isValidDisplayName => true;

  final FormSubmissionStatus formStatus;

  bool isObscure;

  SignUpState({
    this.email = '',
    this.password = '',
    this.displayName = '',
    this.isObscure = true,
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String? email,
    String? password,
    String? displayName,
    bool? isObscure,
    FormSubmissionStatus? formStatus,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
      isObscure: isObscure ?? this.isObscure,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
