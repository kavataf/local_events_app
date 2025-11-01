import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_events/ui/user_auth/show_snack_bar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth auth;
  FirebaseAuthMethods({required this.auth});

  // Email sign up
  Future<void> signUpWithEmail ({
    required String email,
    required String password,
    required BuildContext context
    }) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message!);
    }
  }

//   Email login
  Future<void> loginUserWithEmail ({
    required String email,
    required String password,
    required BuildContext context
}) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if(!auth.currentUser!.emailVerified){
        await sendEmailVerification(context);
      } else {
        showSnackBar(context, 'Log in successful!');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//   Phone login
  Future<void> phoneLogin ({
    required String PhoneNumber,
    required BuildContext context
  }) async{
    await auth.verifyPhoneNumber(
      phoneNumber: PhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
        showSnackBar(context, e.message!);
        },
        codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
  }
//  Email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try{
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message!);
    }
  }

}
