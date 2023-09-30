import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrscanner/models/scans_modesl.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  MapType mapType = MapType.normal;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLgn()));

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLgn(),
      zoom: 17.5,
      tilt: 50,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                await controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      tilt: 50,
                      zoom: 17,
                      target: scan.getLatLgn(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.gps_fixed))
        ],
        centerTitle: true,
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
