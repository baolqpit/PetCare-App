import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/screens/introduction_screens/otp_authentication_screen.dart';

class AuthHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // SIGN UP WITH GOOGLE
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String phoneNumber}) async {
    // await firebaseAuth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        print(error);
      },
      codeSent: (verificationId, forceResendingToken) {
        Get.to(() => OtpAuthentication(verifycationId: verificationId));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print("Auth receive Timeout");
      },
    );
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
