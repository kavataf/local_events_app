import 'package:flutter/material.dart';

class PrivacySettings extends StatelessWidget {
  static const String id = 'privacy_settings';
  const PrivacySettings({super.key});

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
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 20,),
                    Text('Privacy Settings',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Account Privacy & management',
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
                          title: 'Profile Visibility',
                          subtitle: 'Show my profile on search',
                          onPressed: () {},
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          title: 'Delete Account',
                          subtitle: 'Permanently delete your account and data',
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
    required this.title, required this.subtitle, required this.onPressed
  });
  final String subtitle;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.black54),),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_forward_ios, size: 20,),
        ),
        contentPadding: EdgeInsets.only(right: 0.0, left: 5),
      ),
    );
  }
}
