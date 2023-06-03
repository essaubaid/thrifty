abstract class SignInEvent {}

class SignInUsernameChanged extends SignInEvent {
  final String? username;

  SignInUsernameChanged({this.username});
}

class SignInPasswordChanged extends SignInEvent {
  final String? password;

  SignInPasswordChanged({this.password});
}

class PasswordObscure extends SignInEvent {
  final bool? isObscure;

  PasswordObscure({this.isObscure});
}

class SignInSubmitted extends SignInEvent {}

class SignInWithGoogle extends SignInEvent {}

class FormReset extends SignInEvent {}
