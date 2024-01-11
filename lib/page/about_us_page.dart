import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => mapController.move(LatLng(47.47, -0.13), 21),
        child: Icon(Icons.gps_fixed),
      ),
      //bottomSheet: ,
      body: FlutterMap(
          options:
              const MapOptions(initialCenter: LatLng(47.2060287, -1.5393726)),
          mapController: mapController,
          children: [
            TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
            const MarkerLayer(markers: [
              Marker(
                  child: Icon(Icons.school),
                  point: LatLng(47.2060287, -1.5393726))
            ]),
          ]),
    );
  }
}
