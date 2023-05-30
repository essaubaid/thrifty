// ignore_for_file: avoid_print
// import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // final FirebaseAuth _firebaseAuth;

  // AuthRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> login() async {
    print('attempting login');
    await Future.delayed(const Duration(seconds: 2));
    print('logged in');
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
