abstract class SignUpEvent {}

class SignUpEmailChanged extends SignUpEvent {
  final String? email;

  SignUpEmailChanged({this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String? password;

  SignUpPasswordChanged({this.password});
}

class SignUpDisplayNameChanged extends SignUpEvent {
  final String? displayName;

  SignUpDisplayNameChanged({this.displayName});
}

class SignUpIsObscureChanged extends SignUpEvent {
  final bool? isObscure;

  SignUpIsObscureChanged({this.isObscure});
}

class SignUpSubmitted extends SignUpEvent {}

class FormReset extends SignUpEvent {}
