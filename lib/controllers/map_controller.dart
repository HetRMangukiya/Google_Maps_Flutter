import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  var markers = <Marker>[].obs;
  late GoogleMapController googleMapController;

  var mapType = MapType.normal.obs; // Default map type

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void changeMapType(MapType newType) {
    mapType.value = newType;
  }

  Future<void> addMarker(LatLng position) async {
    // Reverse geocoding to get address details
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String title = '${place.locality}, ${place.administrativeArea}, ${place.country}';

        markers.clear(); // Remove any existing markers
        markers.add(
          Marker(
            markerId: MarkerId('searched_location'),
            position: position,
            infoWindow: InfoWindow(
              title: title,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error occurred while adding marker: $e");
    }
  }

  Future<void> searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng target = LatLng(location.latitude, location.longitude);

        // Adjust zoom level based on search query
        double zoomLevel = 14.0;
        if (address.toLowerCase().contains('america')) {
          zoomLevel = 3.0; // Zoom out to show full America
        } else if (address.toLowerCase().contains('india')) {
          zoomLevel = 5.0; // Zoom to show full India
        }

        // Add a marker at the searched location
        await addMarker(target);

        // Move the camera to the searched location
        googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(target, zoomLevel),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
