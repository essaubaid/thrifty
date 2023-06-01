// ignore_for_file: avoid_print
// import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthRepository {
  // final FirebaseAuth _firebaseAuth;
  UserModel? currentUser;

  // AuthRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> login() async {
    print('attempting login');
    // await Future.delayed(const Duration(seconds: 2));
    print('logged in');
    // Initialize currentUser with demo data
    currentUser =
        UserModel(id: '1', name: 'Demo User', email: 'demo.user@test.com');

    return currentUser!;
    // throw Exception('LogIn Failed');
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
