import 'package:flutter/material.dart';
import 'package:local_events/styleguide.dart';

class ChangePassword extends StatefulWidget {
  static const String id = 'change_password';
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _secureText1 = true;
  var _secureText2 = true;
  var _secureText3 = true;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                    Text('Change Password',
                      style: userTextStyle,
                    ),
                    SizedBox(height: 10,),
                    Text('Protect your account with a strong, secure password.',
                      style: user2TextStyle,
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _secureText1 = !_secureText1;
                            });
                          }, icon: Icon(_secureText1 ? Icons.visibility_off : Icons.visibility)),
                          labelText: 'Current Password',
                          labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
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
                        obscureText: _secureText1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        controller: newPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _secureText2 = !_secureText2;
                            });
                          }, icon: Icon(_secureText2 ? Icons.visibility_off : Icons.visibility)),
                          labelText: 'New Password',
                          labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
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
                        obscureText: _secureText2,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _secureText3 = !_secureText3;
                            });
                          }, icon: Icon(_secureText3 ? Icons.visibility_off : Icons.visibility)),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
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
                        obscureText: _secureText3,
                        keyboardType: TextInputType.text,
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
