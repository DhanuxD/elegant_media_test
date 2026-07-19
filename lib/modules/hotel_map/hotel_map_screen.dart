import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/cards/hotel_info_card.dart';
import '../../widgets/zoom_controls/zoom_controls.dart';
import 'hotel_map_controller.dart';

class HotelMapScreen extends StatefulWidget {
  const HotelMapScreen({super.key});

  @override
  State<HotelMapScreen> createState() => _HotelMapScreenState();
}

class _HotelMapScreenState extends State<HotelMapScreen> {
  final controller = Get.find<HotelMapController>();

  late MapController mapController;

  @override
  void initState() {
    super.initState();

    mapController = MapController();

    final data = Get.arguments;

    controller.setHotelData(
      latitude: data["latitude"],
      longitude: data["longitude"],
      hotelName: data["hotelName"],
      hotelImage: data["hotelImage"],
      address: data["address"],
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = LatLng(controller.latitude, controller.longitude);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(title: "Hotel Location"),

        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(initialCenter: location, initialZoom: 15),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

                  userAgentPackageName: "com.example.elegant_media",
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: location,

                      width: 60,

                      height: 60,

                      child: const Icon(
                        Icons.location_on,

                        size: 55,

                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Positioned(
              right: 16,

              top: 20,

              child: ZoomControls(
                onZoomIn: () {
                  mapController.move(
                    mapController.camera.center,

                    mapController.camera.zoom + 1,
                  );
                },

                onZoomOut: () {
                  mapController.move(
                    mapController.camera.center,

                    mapController.camera.zoom - 1,
                  );
                },
              ),
            ),

            Positioned(left: 16, right: 16, bottom: 20, child: HotelInfoCard()),
          ],
        ),
      ),
    );
  }
}
