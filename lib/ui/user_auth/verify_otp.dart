import 'package:flutter/material.dart';
import 'package:local_events/styleguide.dart';

class VerifyOtp extends StatefulWidget {
  static const String id = 'verify_otp';
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                    Text('Verify Your OTP',
                      style: userTextStyle,
                    ),
                    SizedBox(height: 10,),
                    Text('Enter the OTP send to your email to verify your identity and continue securely',
                      style: user2TextStyle,
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'OTP Number',
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Column(
                      children: [
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
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                      child: Text('Send Again', style: TextStyle(fontSize: 17),),
                                    )),
                              ),
                            ),
                          ],
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
