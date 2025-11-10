import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_events/ui/user_auth/show_snack_bar.dart';
import 'package:local_events/ui/user_auth/showotpdialog.dart';

class FirebaseAuthMethods {
  final FirebaseAuth auth;
  FirebaseAuthMethods({required this.auth});

  // Email sign up
  Future<void> signUpWithEmail ({
    required String name,
    required String email,
    required String password,
    required BuildContext context
    }) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(context);
      showSnackBar(context, "Sign up successful!");
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
    TextEditingController codeController = TextEditingController();
    await auth.verifyPhoneNumber(
      phoneNumber: PhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
        showSnackBar(context, e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
       showOTPDialog(context: context,
           codeController: codeController,
           onPressed: () async{
             PhoneAuthCredential credential = PhoneAuthProvider.credential(
                 verificationId: verificationId,
                 smsCode: codeController.text.trim());
             await auth.signInWithCredential(credential);
             Navigator.pop(context);
           }
          );
        }),
        codeAutoRetrievalTimeout:(String verificationId) {
        // null
        });
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
