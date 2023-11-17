/*import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';



class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "https://github.com/Mercyiba";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR Code"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           QrImage(data: qrData),

            SizedBox(height: 10.0),
            Text("Link to the QR "),
            TextField(
              onChanged: (value) {
                setState(() {
                  qrData = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter data",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code),
                  SizedBox(width: 8.0),
                  Text("Generate QR Code", style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/