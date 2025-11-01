import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/ui/event_details/event_details_page.dart';
import 'package:local_events/ui/homepage/category_widget.dart';
import 'package:local_events/ui/homepage/event_widget.dart';
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
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(screenHeight: MediaQuery.of(context).size.height,),
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
                            Icon(
                              Icons.person_2_outlined, size: 30, color: Color(0x99FFFFFF),
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
                            builder: (context, appState, _) => SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for(final category in categories) CategoryWidget(category: category)
                                ],
                              ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Consumer<AppState>(
                            builder: (context, appState, _) =>
                                Column(
                                  children: [
                                    for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
                                       GestureDetector(
                                         onTap: (){
                                           Navigator.of(context).push(MaterialPageRoute(
                                               builder: (context) => EventDetailsPage(event: event)));
                                         },
                                           child: EventWidget(event: event))
                                  ],
                                ),
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
