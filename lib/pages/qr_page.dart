import 'package:flutter/material.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  int _currentIndex = 0;

  Widget _buildReservationCard(BuildContext context) {
    return Card(
      color: Colors.pink[100],
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Your QR Code'),
                content: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/qrcode.png'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Engineering Library",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 35),

                  Icon(Icons.qr_code_2, size: 70,),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "Room 101",
                style: TextStyle(fontSize: 18, color: Colors.grey[200]),
              ),
              SizedBox(height: 8),
              Image.asset("assets/engineering.jpg",),
              SizedBox(height: 8),
              Text(
                "Date: ${DateTime.now().toString()}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Page"),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Text("Today"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: Text("Upcoming"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: Text("Completed"),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildReservationCard(context),
        ],
      ),
    );
  }
}
