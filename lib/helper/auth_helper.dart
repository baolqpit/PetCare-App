import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/screens/introduction_screens/auth_screens/otp_authentication_screen.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class AuthHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  /// SIGN UP WITH GOOGLE
  Future<bool> signUpWithEmail(
      {required String email,
      required String password,
      required String phoneNumber, required BuildContext context}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e){
      showSnackBar(context: context, content: e.code);
      return false;
    }

  }

  // SIGN IN WITH GOOGLE
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // SIGN OUT
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
