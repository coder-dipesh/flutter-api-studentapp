import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  static const String route = "googlemapscreen";

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.704873, 85.311245);
  LatLng newLocation = const LatLng(27.704893, 85.311395);
  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId(myLocation.toString()),
        position: myLocation,
        infoWindow: const InfoWindow(title: "FOD Jeans", snippet: "FOD"),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(newLocation.toString()),
        position: newLocation,
        infoWindow: const InfoWindow(title: "Khaja Ghar", snippet: "Khaja"),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Location"),
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: myLocation,
          zoom: 20,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
