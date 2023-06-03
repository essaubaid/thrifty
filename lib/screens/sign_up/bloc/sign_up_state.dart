import '../../../form_submission_status.dart';

class SignUpState {
  final String email;
  bool get isValidEmail {
    Pattern pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  final String password;
  bool get isValidPassword => password.length > 8;

  final String displayName;
  bool get isValidDisplayName {
    String pattern = r'\d';
    RegExp hasDigits = RegExp(pattern);

    List<String> words = displayName.split(' ');

    if (displayName.isEmpty ||
        hasDigits.hasMatch(displayName) ||
        words.length > 2) {
      return false;
    } else {
      return true;
    }
  }

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
