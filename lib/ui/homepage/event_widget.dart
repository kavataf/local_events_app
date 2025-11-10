import 'package:flutter/material.dart';
import 'package:local_events/styleguide.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../event_details/event_details_page.dart';

class EventWidget extends StatefulWidget {

  const EventWidget({super.key});

  @override
  State<EventWidget> createState() => _EventWidgetState();
  
}

class _EventWidgetState extends State<EventWidget> {
  final _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    print('Selected category: ${appState.selectedCategoryId}');
    print('Type: ${appState.selectedCategoryId.runtimeType}');
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('events')
        .where('categoryid', arrayContains: appState.selectedCategoryId)
            .snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final events = snapshot.data!.docs;
            if(events.isEmpty) {
              return Center(child: Text('No events found in this category'));
            }
          return ListView.builder(
            itemCount: events.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final data = events[index].data() as Map<String, dynamic>;
                final title = data['title'];
                final imagePath = data['imagePath'];
                final location = data['location'];
                final duration = data['duration'];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EventDetailsPage(eventData: data)));
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    elevation: 4,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Image.asset(imagePath, height: 150, fit: BoxFit.fitWidth,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: eventTitleTextStyle,
                                      ),
                                      SizedBox(height: 10,),
                                      FittedBox(
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            SizedBox(width: 5,),
                                            Text(location, style: eventLocationTextStyle,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(duration.toUpperCase(),
                                    textAlign: TextAlign.right,
                                    style: eventLocationTextStyle.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });

        });

  }
}
