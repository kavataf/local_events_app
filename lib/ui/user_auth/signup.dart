import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_events/styleguide.dart';
import 'package:local_events/ui/user_auth/login.dart';
import 'package:flutter/material.dart';

import 'firebase_auth_methods.dart';

class SignUp extends StatefulWidget {
  static const String id = 'signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _secureText = true;
  final _password = FocusNode();
  final _emailFocus = FocusNode();
  final _confirmPassword = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void signUpHere () async{
    FirebaseAuthMethods(auth: FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F8FA),
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Create Account',
                      style: userTextStyle,
                    ),
                    SizedBox(height: 10,),
                    Text('Create a new account to get started and enjoy seamless access to our features',
                      style: user2TextStyle,
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF4700)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(_emailFocus),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        focusNode: _emailFocus,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email address',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF4700)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(_password),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        focusNode: _password,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          }, icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility)),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF4700)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        obscureText: _secureText,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(_confirmPassword),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        focusNode: _confirmPassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          }, icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility)),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF4700)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        obscureText: _secureText,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: TextButton(
                                onPressed: signUpHere,
                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF4700)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Text('Create Account', style: TextStyle(fontSize: 17),),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, LoginPage.id);
                                  },
                                  child: Text('Sign In here',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFFF4700),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
