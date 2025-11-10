import 'package:flutter/material.dart';

class NotificationsSettings extends StatelessWidget {
  static const String id = 'notifications_settings';
  const NotificationsSettings({super.key});

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
                    Text('Notifications & emails',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Notifications',
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
                          title: 'Enable Unread Notification Badge',
                          subtitle: 'Shows a red badge on the app icon when you have unread message',
                          onPressed: () {},
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          title: 'Push Notification Time-out',
                          subtitle: '10 minutes',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Emails',
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
                          title: 'Communications Emails',
                          subtitle: 'Receive email for messages, contacts, documents',
                          onPressed: () {},
                        ),
                        Divider(indent: 10, endIndent: 10,),
                        ListTileWidget(
                          title: 'Announcements & Updates',
                          subtitle: 'Receive email about product updates, improvements, etc.',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Sounds',
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
                          title: 'Disable All Notification Sounds',
                          subtitle: 'Mute all notification of the messages, contracts, documents.',
                          onPressed: () {},
                        )
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
