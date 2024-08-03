// lib/controllers/map_controller.dart
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  var markers = <Marker>[].obs;
  late GoogleMapController googleMapController;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('current_marker'),
        position: position,
        infoWindow: InfoWindow(
          title: 'Marker',
        ),
      ),
    );
    googleMapController.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }

  Future<void> searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng target = LatLng(location.latitude, location.longitude);
        addMarker(target);
        googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(target, 14.0),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
