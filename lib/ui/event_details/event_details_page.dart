import 'package:flutter/material.dart';
import 'package:local_events/ui/event_details/event_details_background.dart';
import 'package:local_events/styleguide.dart';
import '../../model/guest.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.eventData});
  final Map<String, dynamic> eventData;

  @override
  Widget build(BuildContext context) {
    final title = eventData['title'];
    final location = eventData['location'];
    final description = eventData['description'];
    final punchLine1 = eventData['punchLine1'];
    final punchLine2 = eventData['punchLine2'];
    final galleryImages = eventData['galleryImages'];
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          EventDetailsBackground(),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 65,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
              child: Text(
                title,
                style: eventWhiteTitleTextStyle,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
              child: FittedBox(
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 15,),
                    SizedBox(width: 5,),
                    Text(location, style: eventLocationTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),

            ),
            SizedBox(height: 70,),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('GUESTS', style: guestTextStyle,),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(final guest in guests) Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipOval(
                      child: Image.asset(guest.imagePath, width: 90, height: 90, fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: punchLine1, style: punchLine1TextStyle),
                      TextSpan(text: punchLine2, style: punchLine2TextStyle),
                    ],
                  )),
            ),
            if(description.isNotEmpty) Padding(
              padding: EdgeInsets.all(16),
              child: Text(description, style: eventLocationTextStyle,),
            ),
            if(galleryImages.isNotEmpty)Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
              child: Text('GALLERY', style: guestTextStyle,),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(final galleryImage in galleryImages) Container(
                    margin: EdgeInsets.only(left: 16.0, right: 10.0, bottom: 32.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(galleryImage, width: 100, height: 100, fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

