// lib/pages/map_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
