/*ort 'package:flutter/material.dart';
import 'package:geoglamour/accesorio.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: crearqr(),
    );
  }
}
class crearqr extends StatefulWidget{
  @override
  _crearqrState createState() => _crearqrState();
}

class _crearqrState extends State<crearqr> {
  TextEditingController _editingController =
      TextEditingController(text: 'LirsTechTips');
  late String data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Generator de QR')),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
              controller: _editingController,
            ),
            ElevatedButton(
              onPressed: (){
              setState(() {
                data = TextEditingController() as String;
              });
            },
              child: Text('Generar QR'),

            ),
            Center(
              child: QrlImage(
                (data = '$data') as QrCode,
                version : QrVersions.auto,
                size: 300,
              ),
            )
          ],
        ),
      ),
    ));
  }
**/