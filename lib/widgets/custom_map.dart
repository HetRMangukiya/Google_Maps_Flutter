import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_example/controllers/map_controller.dart';

class CustomMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.find();
    return GoogleMap(
      onMapCreated: mapController.onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(22.5937, 78.9629), // Coordinates for the center of India
        zoom: 5, // Adjust zoom level to show the whole country
      ),
      markers: mapController.markers.toSet(),
      onTap: (position) {
        mapController.addMarker(position);
      },
    );
  }
}
