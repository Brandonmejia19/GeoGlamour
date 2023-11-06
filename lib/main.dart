import 'package:flutter/material.dart';
import 'package:geoglamour/accesorio.dart';
import 'package:geoglamour/reportar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  late GoogleMapController mapController;
  LatLng? _currentLocation;
  LatLng _initialLocation =
      const LatLng(13.565842, -89.115616); // Coordenadas iniciales

  Marker _initialLocationMarker = Marker(
    markerId: const MarkerId("initial_location"),
    position: const LatLng(13.565842, -89.115616),
    // Ubicación inicial
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    // Icono personalizado (azul)
    infoWindow: const InfoWindow(
      title: "Ubicación Inicial",
      snippet: "Lat: ${13.565842}, Lng: ${-89.115616}",
    ),
  );

  _centerOnLocation() {
    if (_currentLocation != null) {
      mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
    } else {
      // Si no se pudo obtener la ubicación actual, regresa a la ubicación inicial
      mapController.animateCamera(CameraUpdate.newLatLng(_initialLocation));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa Geoglamour',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                children: [
                  Text(
                    'GeoGlamour',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Image.asset(
                    'logoblanco.png',
                    width: 1, // Ajusta el ancho según tus preferencias
                    height: 1, // Ajusta la altura según tus preferencias
                  ), //
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Mapa',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página de inicio aquí
              },
            ),
            ListTile(
              title: Text(
                'Accesorios',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => accesorios()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
            ListTile(
              title: Text(
                'Reportar',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reportar()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
            ListTile(
              title: Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Colors.red,
                  // Cambia el color del texto a rojo
                  fontSize: 20.0,
                  // Cambia el tamaño de la fuente según tus preferencias
                  fontWeight: FontWeight
                      .bold, // Cambia el peso de la fuente según tus preferencias
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  // Ajusta el valor de flex según tu preferencia para el ancho de la imagen
                  child: Image.asset('images/pulsera1.jpg'),
                  // Cambia 'ruta_de_la_imagen.png' por la ruta de tu imagen
                ),
                const SizedBox(width: 16.0),
                // Agrega espacio entre la imagen y el texto
                const Expanded(
                  flex: 3, // Ajusta el valor de flex para el ancho del texto
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de la foto',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descripción de la foto y detalles adicionales.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _initialLocation,
                    zoom: 16.0, // Ajusta el zoom según tus necesidades
                  ),
                  markers: _currentLocation != null
                      ? Set<Marker>.from([
                          _initialLocationMarker,
                          // Agrega el marcador personalizado al conjunto de marcadores
                        ])
                      : Set<Marker>(),
                ),
                Positioned(
                  top: 500,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: _centerOnLocation,
                    // Define la función para centrar en la ubicación actual
                    child: Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
