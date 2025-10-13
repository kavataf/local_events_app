import 'package:flutter/material.dart';
import 'package:local_events/ui/event_details/event_details_background.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';
import 'event_details_content.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}

