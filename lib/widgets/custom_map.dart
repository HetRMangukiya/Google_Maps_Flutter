import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_example/controllers/map_controller.dart';

class CustomMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.find();
    return Obx(() => GoogleMap(
      onMapCreated: mapController.onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(22.5937, 78.9629),
        zoom: 5,
      ),
      mapType: mapController.mapType.value, // Set the map type
      markers: mapController.markers.toSet(),
      onTap: (position) {
        mapController.addMarker(position);
      },
    ));
  }
}
