import '../../../form_submission_status.dart';

class SignInState {
  final String username;
  bool get isValidUsername {
    Pattern pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(username);
  }
  // bool get isValidUsername => true;

  final String password;
  bool get isValidPassword => password.length > 8;
  // bool get isValidPassword => true;

  final FormSubmissionStatus formStatus;
  final bool isObscure;

  SignInState({
    this.username = '',
    this.password = '',
    this.isObscure = true,
    this.formStatus = const InitialFormStatus(),
  });

  SignInState copyWith({
    String? username,
    String? password,
    bool? isObscure,
    FormSubmissionStatus? formStatus,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
