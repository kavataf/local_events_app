import 'package:flutter/material.dart';
import 'package:local_events/styleguide.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot_password';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();
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
                    Text('Forgot Password',
                      style: userTextStyle,
                    ),
                    SizedBox(height: 10,),
                    Text('Enter your email address to receive a reset link and regain access to your account',
                      style: user2TextStyle,
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        autofocus: true,
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
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF4700)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Text('Continue', style: TextStyle(fontSize: 17),),
                                )),
                          ),
                        ),
                      ],
                    ),

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
