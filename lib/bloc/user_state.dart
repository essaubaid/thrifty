import 'package:thrifty/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoggedIn extends UserState {
  final UserModel user;

  UserLoggedIn({required this.user});
}
