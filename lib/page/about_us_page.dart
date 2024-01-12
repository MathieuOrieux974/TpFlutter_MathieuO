import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final mapController = MapController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions( initialCenter: LatLng(56,45)),
          mapController: mapController,
        children: [
          TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
          const MarkerLayer(markers: [
            Marker(child: Icon(Icons.school),point: LatLng(47.2061667,-1.5419619))
          ])

        ],

      )
    );
  }
}
