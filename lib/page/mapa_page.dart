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


    /// VERIFICA SE A LOCALIZAÇÃO ESTÁ ATIVA
    if (!await Geolocator.isLocationServiceEnabled()) {
      return Future.error("A localização está desabilitada !"); ///DÁ ERRO
    }

    /// VERIFICA SE O USUARIO DEU PERMISSÃO DE LOCALIZAÇÃO PARA O APP
    if (!await Permission.location.isGranted) {

      /// SOLICITA PERMISSÃO
      var permissionAcess = await Permission.location.request();

      /// VERIFICA NOVAMENTE SE A PERMISSÃO FOI DADA
      if (!permissionAcess.isGranted) {
        return Future.error("O usuário necessita dar permissão !"); ///DÁ ERRO
      }
    }

    /// RETORNA A POSIÇÃO DO CELULAR DO USUARIO COM A MELHOR PRECISÃO
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  void initState() {
    super.initState();
    geolocation().then((localization) {
      setState(() {
        var place = LatLng(localization.latitude, localization.longitude);

        /// ADICIONA MARCARDOR
        position.add(Marker(
          markerId: new MarkerId("position"),
          position: place,
        ));


        showPosition(place);
      });
    });
  }

  /// CRIA ANIMAÇÃO PARA IR ATE A POSIÇÃO DO CELULAR DO USUARIO
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
