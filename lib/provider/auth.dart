import 'package:firebase_auth/firebase_auth.dart';
import "package:google_sign_in/google_sign_in.dart";
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
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
