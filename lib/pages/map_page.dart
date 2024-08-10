import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_example/controllers/map_controller.dart';
import 'package:google_maps_flutter_example/widgets/custom_map.dart';

class MapPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    final MapController mapController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with GetX'),
      ),
      body: Column(
        children: [
          Obx(() {
            return DropdownButton<MapType>(
              value: mapController.mapType.value,
              icon: Icon(Icons.map, color: Colors.white),
              dropdownColor: Colors.white,
              underline: SizedBox(),
              onChanged: (MapType? newType) {
                if (newType != null) {
                  mapController.changeMapType(newType);
                }
              },
              items: <DropdownMenuItem<MapType>>[
                DropdownMenuItem(
                  child: Text('Default'),
                  value: MapType.normal,
                ),
                DropdownMenuItem(
                  child: Text('Satellite'),
                  value: MapType.satellite,
                ),
                DropdownMenuItem(
                  child: Text('Terrain'),
                  value: MapType.terrain,
                ),
                DropdownMenuItem(
                  child: Text('Hybrid (Satellite + Labels)'),
                  value: MapType.hybrid,
                ),
              ],
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for a place',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String address = searchController.text;
                    mapController.searchAndNavigate(address);
                  },
                ),
              ),
            ),
          ),
          Expanded(child: CustomMap()),
        ],
      ),
    );
  }
}
