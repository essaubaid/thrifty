// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/user_block.dart';
import '../bloc/user_event.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  UserModel? currentUser;

  // AuthRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      // UserCredential userCredential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //         email: 'essaubaid@gmail.com', password: 'essaubaid');
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

  Future<void> logout({required BuildContext context}) async {
    await _firebaseAuth.signOut();

    // Also sign out from Google
    await googleSignIn.signOut();

    // ignore: use_build_context_synchronously
    context.read<UserBloc>().add(UserLogoutEvent());
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

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? firebaseUser = userCredential.user;

      await firebaseUser?.updateDisplayName(displayName);

      await firebaseUser?.reload();
      firebaseUser = _firebaseAuth.currentUser;

      UserModel newUser = UserModel(
        id: firebaseUser!.uid,
        email: firebaseUser.email!,
        displayName: firebaseUser.displayName,
        photoURL: firebaseUser.photoURL,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUser.id)
          .set(newUser.toJson());

      return newUser;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserModel> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    currentUser = UserModel.fromFirebaseUser(userCredential.user!);

    return currentUser!;
  }
}
