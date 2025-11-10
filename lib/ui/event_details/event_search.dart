import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_events/ui/event_details/event_details_page.dart';
import '../../styleguide.dart';

class EventSearch extends StatefulWidget {
  static const String id = 'event_search';
  const EventSearch({super.key});

  @override
  State<EventSearch> createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFEEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: Icon(Icons.arrow_back_ios)),
                    SizedBox(width: 40,),
                    Text('Discover Amazing Events',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search event...',
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
                    fillColor: Colors.white60,
                  ),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                          foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Coming Soon',
                            style: TextStyle(fontSize: 17),
                          ),
                        ))),
                    SizedBox(width: 10,),
                    Expanded(child: TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                          foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('History',
                              style: TextStyle(fontSize: 17)
                          ),
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('events')
                    .snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final events = snapshot.data!.docs;
                    // filter events by search inputs

                    final filteredEvents = events.where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final title = data['title']?.toString().toLowerCase() ?? '';
                      return title.contains(searchQuery);
                    }).toList();

                    if(filteredEvents.isEmpty) {
                      return Center(child: Text('No Upcoming events',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ));
                    }
                    return ListView.builder(
                        itemCount: filteredEvents.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = filteredEvents[index].data() as Map<String, dynamic>;
                          final title = data['title'];
                          final imagePath = data['imagePath'];
                          final location = data['location'];
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
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      child: Image.asset(imagePath, height: 150, fit: BoxFit.fitWidth,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0, left: 5.0),
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
                                                Text('Jul 21, 2025 at 7:00 pm',
                                                  style: TextStyle(fontSize: 17, color: Color(0xFFFF4700),
                                                  fontWeight: FontWeight.w500),),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });

                  })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
