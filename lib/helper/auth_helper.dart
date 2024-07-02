import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // SIGN UP WITH GOOGLE
  Future<void> signUpWithEmail({required String email, password}) async {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: 'https://petcareapp-c60ec.firebaseapp.com.com/__/auth/action?mode=signIn&email=$email',
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      androidInstallApp: true,
      androidMinimumVersion: '12',
    );
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await firebaseAuth.sendSignInLinkToEmail(email: email, actionCodeSettings: actionCodeSettings);
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
