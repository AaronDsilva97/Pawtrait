import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth firebaseAuth;

  AuthProvider({this.firebaseAuth});

  Stream<User> get authState => firebaseAuth.idTokenChanges();

  //SIGN UP METHOD
  Future<String> signUp({
    @required String email,
    @required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up!";
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future<String> signIn({
    @required String email,
    @required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> updateDisplayName(displayName) async {
    await firebaseAuth.currentUser.updateProfile(displayName: displayName);
  }

  Future<void> updatePhotoUrl(photoUrl) async {
    await firebaseAuth.currentUser.updateProfile(photoURL: photoUrl);
  }
}
