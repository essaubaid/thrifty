import 'package:thrifty/models/user_model.dart';

abstract class UserEvent {}

class UserLoginEvent extends UserEvent {
  final UserModel user;

  UserLoginEvent({required this.user});
}

class UserLogoutEvent extends UserEvent {}
