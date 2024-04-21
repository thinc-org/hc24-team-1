import 'package:flutter/material.dart';
import 'package:libro_locate/models/libraryinfo.dart'; // Import the LibraryInfo and LibraryInfoService classes
import 'package:cached_network_image/cached_network_image.dart';
class LibraryInfoScreen extends StatefulWidget {
  @override
  _LibraryInfoScreenState createState() => _LibraryInfoScreenState();
}

class _LibraryInfoScreenState extends State<LibraryInfoScreen> {
  late Future<List<LibraryInfo>> libraryInfoFuture;

  @override
  void initState() {
    super.initState();
    libraryInfoFuture = LibraryInfoService().fetchLibraryInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library Information',
          style: TextStyle(color: Colors.white,  fontFamily: "Chulalongkorn")),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),

      body: FutureBuilder<List<LibraryInfo>>(
        future: libraryInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                LibraryInfo libraryInfo = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/indlibrarydetails_page',
                      arguments: libraryInfo, // Pass the libraryInfo object to the detail page
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.pink[200], // Set background color to pink shade 300
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                libraryInfo.imageAssetPath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[300], // Example color for space availability indicator
                                  radius: 35,
                                  child: Text(
                                    '${libraryInfo.spaceavailability}%',
                                    style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            title: Text(
                              libraryInfo.libraryName,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 20),
                                    SizedBox(width: 5),
                                    Text(
                                      'Opening & Closing Time: ${libraryInfo.openingTime} :00 am - ${libraryInfo.closingTime} :00 pm',
                                      style: TextStyle( fontSize: 12),

                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.directions_car, size: 20),
                                    SizedBox(width: 5),
                                    Text('Time of Travel: ${libraryInfo.timeOfTravel} min', style: TextStyle( fontSize: 12),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 20),
                                    SizedBox(width: 5),
                                    Text('Distance: ${libraryInfo.distance} km', style: TextStyle( fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );



              },
            );
          }
        },
      ),
    );
  }
}
