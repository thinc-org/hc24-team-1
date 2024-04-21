import 'package:flutter/material.dart';

class ReservePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Reserve Room",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink[200],
          iconTheme: IconThemeData(color: Colors.white)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date and Time:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        SizedBox(height:16),
        TextField(

          decoration: InputDecoration(
            labelText: 'Enter your date and time',
            border: OutlineInputBorder(),contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),),
            SizedBox(height: 16),
            // Date and Time picker widgets can be added here
            Text(
              'Available Rooms:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Replace this with ListView.builder or other widget to display available rooms
            _buildRoomCard('A', 'assets/studyroom.jpg', ['WiFi', 'Projector']),
            SizedBox(height: 16),
            _buildRoomCard('B', 'assets/studyroom.jpg', ['WiFi', 'Whiteboard']),
            SizedBox(height: 16),
            _buildRoomCard('C', 'assets/studyroom.jpg', ['Projector', 'Whiteboard'])
          ],
        ),
      ),
    );
  }

  Widget _buildRoomCard(String roomNumber, String imagePath, List<String> facilities) {
    return Card(
      color: Colors.pink[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Room $roomNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: facilities.map((facility) => _buildFacilityIcon(facility)).toList(),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(String facility) {
    IconData icon= Icons.add;
    switch (facility) {
      case 'WiFi':
        icon = Icons.wifi;
        break;
      case 'Projector':
        icon = Icons.videocam;
        break;
      case 'Whiteboard':
        icon = Icons.border_all;
        break;
    // Add more facilities as needed
    }
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Icon(icon, color: Colors.grey[300]), // Set icon color to grey
    );
  }
}
