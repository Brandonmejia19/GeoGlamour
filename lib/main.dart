import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geoglamour/accesorio.dart';
import 'package:geoglamour/firebase_options.dart';
import 'package:geoglamour/reportar.dart';
import 'package:geoglamour/views/home_page.dart';
import 'package:geoglamour/views/login_page.dart';
import 'package:geoglamour/views/sign_up_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


import 'login.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
      initialRoute: "/login",
      routes: {
        "/MapScreen": (context) =>  MapScreen(),
        "/login":(context) => const LoginPage(),
        "/signup":(context) => const SignUpPage(),
      },
    );
  }
}
const LatLng _center = const LatLng(13.496515186614328, -88.8668064265836);
final Set<Marker> _markers = {};
LatLng _lastMapPosition = _center;
MapType _currentMapType = MapType.satellite;

void _onMapTypeButtonPressed() {
  _lastMapPosition = _center;
  _currentMapType =
  _currentMapType == MapType.satellite ? MapType.satellite : MapType.satellite;
}

void _onAddMarkerButtonPressed() {
  _markers.add(Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId(_lastMapPosition.toString()),
    position: _lastMapPosition,
    infoWindow: InfoWindow(
      title: 'Casa gautemala',
      snippet: '5 Star Rating',
    ),
    icon: BitmapDescriptor.defaultMarker,
  ));
}

// Objeto con propiedades de latitud y longitud
class Coordenadas {
  double latitud = 0;
  double longitud = 0;

  Coordenadas({required this.latitud, required this.longitud});
}

// Creación de un objeto Coordenadas
Coordenadas coordenadas = Coordenadas(latitud: 13.497406, longitud: -88.866378);

// Creación de un objeto LatLng usando las propiedades del objeto Coordenadas
LatLng ubicacion = LatLng(coordenadas.latitud, coordenadas.longitud);

class MapScreen extends StatelessWidget {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.496515186614328, -88.8668064265836);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> obtenerUbicacionActual() async {
    try {
      Position posicion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print('Ubicación actual: ${posicion.latitude}, ${posicion.longitude}');
    } catch (e) {
      print('Error al obtener la ubicación: $e');
    }
  }

  LatLng? _currentLocation;
  LatLng _initialLocation =
 LatLng(coordenadas.latitud, coordenadas.longitud); // Coordenadas iniciales

  Marker _initialLocationMarker = Marker(
    markerId: const MarkerId("initial_location"),
    position:  LatLng(coordenadas.latitud, coordenadas.longitud),
    // Ubicación inicial
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    // Icono personalizado (azul)
    infoWindow: const InfoWindow(
      title: "Ubicación Inicial",
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
        backgroundColor: Colors.lightBlue,
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
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text(
                    'GeoGlamour',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/logo2.png',
                    width: 100, // Ajusta el ancho según tus preferencias
                    height: 98, // Ajusta la altura según tus preferencias
                  ), //
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.map,color: Colors.lightGreen,),
              title: Text(
                'Mapa',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página de inicio aquí
              },
            ),
            ListTile(
              leading: Icon(Icons.diamond_rounded,color: Colors.lightBlue,),
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
              leading: Icon(Icons.report,color: Colors.deepOrange,),
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
              leading: Icon(Icons.exit_to_app,color: Colors.red,),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
                  flex: 1,
                  // Ajusta el valor de flex según tu preferencia para el ancho de la imagen
                  child: Image.asset('assets/img.png'),
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
                        'Accesorio para Mascotas',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Collar Rojo para gatos cachorros \n'
                            'ID:2234242\n'
                            'Dueño: Brandon Mejia',
                        style: TextStyle(fontSize: 15.0),
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
                    MapType.satellite;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _initialLocation,
                    zoom: 30, // Ajusta el zoom según tus necesidades
                  ),
                  markers: {
                    const Marker(
                      markerId: const MarkerId("Accesorios"),
                      position: LatLng(13.496515186614328, -88.8668064265836),
                      infoWindow: InfoWindow(
                        title: "Accesorio #1",
                        snippet: "Collar para Mascotas",
                      ),
                    ),
                  },
                ),
                Positioned(
                  top: 470,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: _centerOnLocation,
                    // Define la función para centrar en la ubicación actual
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.my_location),
                  ),
                ),
                Positioned(
                  top: 400,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: (){},
                    // Define la función para centrar en la ubicación actual
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.map_sharp),
                  ),
                ),
                Positioned(
                  top: 330,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: _onAddMarkerButtonPressed,
                    // Define la función para centrar en la ubicación actual
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.add_location_alt),
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
