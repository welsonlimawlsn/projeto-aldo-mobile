import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> position = {};

  Future<Position> geolocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return Future.error("A localização está desabilitada !");
    }
    if (!await Permission.location.isGranted) {
      var permissionAcess = await Permission.location.request();

      if (!permissionAcess.isGranted) {
        return Future.error("O usuário necessita dar permissão !");
      }
    }

    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  void initState() {
    super.initState();
    geolocation().then((localization) {
      setState(() {
        var place = LatLng(localization.latitude, localization.longitude);
        position.add(Marker(
          markerId: new MarkerId("position"),
          position: place,
        ));
        showPosition(place);
      });
    });
  }

  void showPosition(LatLng localization) async {
    var controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: localization, zoom: 18)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eu no mapa'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-15.8318, -48.0373),
          zoom: 19,
        ),
        markers: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
