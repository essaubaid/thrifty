import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  final _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserData(String userId) async {
    final docSnapshot = await _usersCollection.doc(userId).get();
    if (docSnapshot.exists) {
      return UserModel.fromJson(docSnapshot.data()!);
    } else {
      throw Exception('User not found');
    }
  }
}
