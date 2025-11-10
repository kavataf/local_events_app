import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_events/styleguide.dart';
import 'package:local_events/ui/user_auth/firebase_auth_methods.dart';
import 'package:local_events/ui/user_auth/forgot_password.dart';
import 'package:local_events/ui/user_auth/signup.dart';

import '../homepage/home_page.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _secureText = true;
  var value = false;
  final _password = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> loginUser () async {
    await FirebaseAuthMethods(auth: FirebaseAuth.instance).loginUserWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    Navigator.pushNamed(context, HomePage.id);
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
                    Text('Log in',
                      style: userTextStyle,
                    ),
                    SizedBox(height: 10,),
                    Text('Enter your email and password to securely access your account and manage your services',
                        style: user2TextStyle,
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        autofocus: true,
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
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(value: value,
                                onChanged: (value){
                                 setState(() {
                                   this.value = value!;
                                 });
                                },
                              activeColor: Color(0xFFFF4700),
                            ),
                            Text('Remember me',
                              style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, ForgotPassword.id);
                            },
                              child: Text('forgot password?',
                                  style: TextStyle(fontSize: 16,
                                  color: Color(0xFFFF4700)))),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: TextButton(
                                    onPressed: loginUser,
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF4700)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                      child: Text('Login', style: TextStyle(fontSize: 17),),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFF6F8FA)),
                                      side: WidgetStateProperty.all(BorderSide(
                                        color:Colors.black54,
                                        width: 2,
                                      ),),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/google.png', width: 30,
                                          height: 30,
                                         ),
                                        SizedBox(width: 10),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                          child: Text('Sign in with Google', style: TextStyle(fontSize: 20),),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
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
                                    Navigator.pushNamed(context, SignUp.id);
                                  },
                                  child: Text('Sign Up here',
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
