/*PRUEBA DE MAPA DE UBICACION REAL
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete url_launcher

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen2(),
    );
  }
}

_openGoogleMapsLocation(String googleMapsLink) async {
  if (await canLaunch(googleMapsLink)) {
    await launch(googleMapsLink);
  } else {
    throw 'No se pudo abrir Google Maps';
  }
  ElevatedButton(
    onPressed: () {
      String googleMapsLink = 'https://maps.app.goo.gl/VPXydcSbA4LS6YQo6'; // Reemplaza latitud y longitud con las coordenadas reales
      _openGoogleMapsLocation(googleMapsLink);
    },
    child: Text('Abrir ubicación en Google Maps'),
  );
}
*/
