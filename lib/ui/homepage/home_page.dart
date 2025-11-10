import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../user_auth/login.dart';
import 'event_widget.dart';
import 'package:local_events/ui/accounts/user.dart';
import 'package:local_events/ui/homepage/category_widget.dart';
import 'package:local_events/ui/homepage/home_page_background.dart';
import 'package:local_events/styleguide.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../../model/category.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, LoginPage.id));
      return Center(child: CircularProgressIndicator(),);
    }

      return Scaffold(
        body: ChangeNotifierProvider<AppState>(
          create: (_) => AppState(),
          child: Stack(
            children: [
              HomePageBackground(screenHeight: MediaQuery
                  .of(context)
                  .size
                  .height,),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          children: [
                            Text('LOCAL EVENTS',
                              style: fadedTextStyle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, UserAccount.id);
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFFFF),
                                child: Icon(
                                  Icons.person_2_outlined, size: 30,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text('What\'s up',
                          style: whiteHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Consumer<AppState>(
                          builder: (context, appState, _) =>
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for(final category in categories) CategoryWidget(
                                        category: category)
                                  ],
                                ),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            EventWidget()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
