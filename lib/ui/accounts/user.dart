import 'package:flutter/material.dart';
import 'package:local_events/ui/accounts/privacy_settings.dart';
import 'package:local_events/ui/accounts/user_profile.dart';
import 'package:local_events/ui/user_auth/change_password.dart';
import 'package:local_events/ui/user_auth/forgot_password.dart';
import 'package:local_events/ui/user_auth/login.dart';
import 'notifications_settings.dart';

class UserAccount extends StatelessWidget {
  static const String id = 'user';
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFFFFF),
                          backgroundImage: AssetImage('assets/avatar.png'),
                          radius: 30,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Faith Kavata',
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            Text('kavatafaith412@gmail.com',
                                style: TextStyle(fontSize: 15, color: Colors.black54)
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.logout, color: Colors.red,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('MY ACCOUNT',
                    style: TextStyle(fontSize: 17, color: Colors.black54)
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTileWidget(
                          icon: Icon(Icons.person, size: 20,),
                          title: 'My Profile',
                          onPressed: () {
                            Navigator.pushNamed(context, UserProfile.id);
                          },
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          icon: Icon(Icons.note_alt_rounded, size: 20,),
                          title: 'Privacy Settings',
                          onPressed: () {
                            Navigator.pushNamed(context, PrivacySettings.id);
                          },
                          ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          icon: Icon(Icons.notifications_active, size: 20,),
                          title: 'Notifications Settings',
                          onPressed: () {
                            Navigator.pushNamed(context, NotificationsSettings.id);
                          },
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('SECURITY',
                    style: TextStyle(fontSize: 17, color: Colors.black54)
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTileWidget(
                          icon: Icon(Icons.lock, size: 20,),
                          title: 'Change Password',
                          onPressed: () {
                            Navigator.pushNamed(context, ChangePassword.id);
                          },
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          icon: Icon(Icons.lock_clock_outlined, size: 20,),
                          title: 'Forgot Password',
                          onPressed: () {
                            Navigator.pushNamed(context, ForgotPassword.id);
                          },
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          icon: Icon(Icons.privacy_tip_outlined, size: 20,),
                          title: 'Enable Biometrics',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title, required this.icon, required this.onPressed
  });
  final Icon icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xFFF8F7FE),
          child: icon,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500),),
        trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios, size: 20,),
        ),
        contentPadding: EdgeInsets.only(right: 0.0, left: 5),
      ),
    );
  }
}
