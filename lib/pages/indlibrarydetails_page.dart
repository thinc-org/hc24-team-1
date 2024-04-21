import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libro_locate/main.dart';
import 'package:libro_locate/pages/reservepage.dart';
import '../models/libraryinfo.dart';
import 'libraryinfoscreen.dart';

class LibraryDetailPage extends StatefulWidget {
  @override
  _LibraryDetailPageState createState() => _LibraryDetailPageState();
}

class _LibraryDetailPageState extends State<LibraryDetailPage> {
  bool isLibrarySaved = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve the libraryInfo object passed from the LibraryListPage
    final LibraryInfo libraryInfo =
    ModalRoute.of(context)!.settings.arguments as LibraryInfo;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            libraryInfo.libraryName,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink[200],
          iconTheme: IconThemeData(color: Colors.white)),
      body: Column(
        children: [
          // Background image fitting the top 25% of the page
          Expanded(
            flex: 2,
            child: Image.asset(
              libraryInfo.imageAssetPath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          // Card containing information occupying the remaining 75%
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Library name with save icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(isLibrarySaved ? Icons.favorite : Icons.favorite_border),
                            color: isLibrarySaved ? Colors.red : Colors.grey, // Change color based on saved state
                            onPressed: () {
                              setState(() {
                                isLibrarySaved = !isLibrarySaved; // Toggle saved state
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          Text(
                            libraryInfo.libraryName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Add your save logic here
                    ],
                  ),
                  SizedBox(height: 16),
                  // Information about opening time, closing time, and distance
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 20),
                          SizedBox(width: 8),
                          Text('Time:', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text(
                            '${libraryInfo.openingTime} :00 am to ${libraryInfo.closingTime} :00 pm',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),


                      Row(
                        children: [
                          Icon(Icons.location_on, size: 20),
                          SizedBox(width: 8),
                          Text('Distance:', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text(
                            '${libraryInfo.distance} km',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 20),
                          SizedBox(width: 8),
                          Text('Time to Travel:', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text(
                            '${libraryInfo.timeOfTravel} min',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Space availability indicator

                  SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width , // Take half of the page in width
                  child: Row(
                    children: [
                      Text(
                        'Space Availability:',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 70),
                       // Add some space between text and circle
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Make it circular
                          border: Border.all(color: Colors.grey.shade400, width: 7),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // Make it circular
                                color: libraryInfo.spaceavailability >= 50 ? Colors.green[200] : Colors.red[200],
                              ),
                              child: Text(
                                '${libraryInfo.spaceavailability}%',
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                  SizedBox(height: 26),
                  // Facilities and icons

                  Text("Facilities:",style: TextStyle(fontSize: 16) ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.wifi),
                      SizedBox(width: 8),
                      Text('WiFi'),
                      SizedBox(width: 16),
                      Icon(Icons.local_cafe),
                      SizedBox(width: 8),
                      Text('Cafe'),
                      SizedBox(width: 50),

                      SizedBox(
                        width: 150, // Adjust width as needed
                        height: 40, // Adjust height as needed
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservePage(),
                              ),
                            );
                            // Add your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[200], // Background color
                          ),
                          child: Text(
                            'Reserve',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Add more facilities as needed
                    ],
                  ),

    ] ),
    ),
    ),



    ],)
    );
  }
}
