import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoglamour/accesorio.dart';
import 'package:geoglamour/qr.dart';
import 'package:geoglamour/reportar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng? _currentLocation;
LatLng _initialLocation =
const LatLng(13.565842, -89.115616); // Coordenadas iniciales
// timer o bajo demanda de un boton
// Invocar las coordenadas de x dispositivo  de la base de datos

// Pintar en Mapa

Marker _initialLocationMarker = Marker(
  markerId: const MarkerId("initial_location"),
);

_centerOnLocation() {

  if (_currentLocation != null) {
    mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
  } else {
    // Agrega la lógica para navegar a la página "Acerca de" aquí
  },
  ),
  /* COMENTARIO PARA PRUEBA DE UBICACIO EN TIEMPO REAL
            /* COMENTARIO PARA PRUEBA DE UBICACIO EN TIEMPO REAL*/
           ListTile(
              title: Text(
                'Pruebaaaa',
                'Escanear QR',
                style: TextStyle(
                  color: Colors.red,
                  // Cambia el color del texto a rojo
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prueba()),
                  MaterialPageRoute(builder: (context) => QRCodeScannerPage()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),*/
  ),
  ],
  ),
  ),