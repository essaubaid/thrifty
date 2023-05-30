abstract class SignInEvent {}

class SignInUsernameChanged extends SignInEvent {
  final String? username;

  SignInUsernameChanged({this.username});
}

class SignInPasswordChanged extends SignInEvent {
  final String? password;

  SignInPasswordChanged({this.password});
}

class SignInSubmitted extends SignInEvent {}

class FormReset extends SignInEvent {}
