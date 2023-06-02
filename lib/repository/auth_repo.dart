// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserModel? currentUser;

  // AuthRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: 'essaubaid@gmail.com', password: 'essaubaid');
      currentUser = UserModel.fromFirebaseUser(userCredential.user!);
      return currentUser!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    currentUser = null;
  }

  // Future<User?> firebaseLogin(String email, String password) async {
  //   try {
  //     print('attempting login');

  //     final UserCredential userCredential =
  //         await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // Access the user information from the userCredential
  //     final User? user = userCredential.user;
  //     print('logged in');
  //     return user; // returning the User

  //   } catch (error) {
  //     // Handle any errors that occurred during authentication
  //     print('Login failed: $error');
  //     throw Exception('LogIn Failed'); // throwing an exception
  //   }
  // }
}
