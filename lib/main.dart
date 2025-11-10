import 'package:flutter/material.dart';
import 'package:local_events/ui/accounts/notifications_settings.dart';
import 'package:local_events/ui/accounts/privacy_settings.dart';
import 'package:local_events/ui/accounts/user.dart';
import 'package:local_events/ui/accounts/user_profile.dart';
import 'package:local_events/ui/user_auth/change_password.dart';
import 'package:local_events/ui/user_auth/forgot_password.dart';
import 'package:local_events/ui/user_auth/signup.dart';
import 'package:local_events/ui/user_auth/verify_otp.dart';
import 'ui/homepage/home_page.dart';
import 'ui/user_auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        // pageBackground: ,
        primaryColor: Color(0xFFFF4700),
      ),
      home: LoginPage(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        SignUp.id: (context) => const SignUp(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        VerifyOtp.id: (context) => const VerifyOtp(),
        UserAccount.id: (context) => const UserAccount(),
        UserProfile.id: (context) => const UserProfile(),
        NotificationsSettings.id: (context) => const NotificationsSettings(),
        ChangePassword.id: (context) => const ChangePassword(),
        PrivacySettings.id: (context) => const PrivacySettings(),
      },
    );
  }
}