import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/info_row/app_info_row.dart';
import '../../widgets/labels/app_labels.dart';
import '../../widgets/network_image/app_network_image.dart';
import 'hotel_details_controller.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({super.key});

  final HotelDetailsController controller = Get.find<HotelDetailsController>();

  @override
  Widget build(BuildContext context) {
    final hotel = controller.hotel;

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(title: "Hotel Details"),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              SizedBox(
                height: 260,
                width: double.infinity,
                child: AppNetworkImage(imageUrl: hotel.image.medium),
              ),

              Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    AppLabel(
                      maxLines: 3,
                      text: hotel.title,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),

                        SizedBox(width: 5),

                        AppLabel(text: "4.8 Rating"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    AppLabel(
                      text: "About this hotel",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),

                    const SizedBox(height: 8),

                    AppLabel(text: hotel.description, maxLines: 20),

                    const SizedBox(height: 25),

                    AppLabel(
                      text: "Contact Information",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),

                    const SizedBox(height: 10),

                    AppInfoRow(icon: Icons.location_on, value: hotel.address),

                    AppInfoRow(icon: Icons.phone, value: hotel.phoneNumber),

                    AppInfoRow(
                      icon: Icons.pin_drop,
                      value: "${hotel.latitude}, ${hotel.longitude}",
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.phone),
                            label: Text("Call"),
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.map),
                            label: const Text("Map"),

                            onPressed: () {
                              final lat = double.tryParse(hotel.latitude);
                              final lng = double.tryParse(hotel.longitude);

                              if (lat != null && lng != null) {
                                Get.toNamed(
                                  AppRoutes.HOTELMAPSCREEN,
                                  arguments: {
                                    "latitude": lat,

                                    "longitude": lng,

                                    "hotelName": hotel.title,

                                    "hotelImage": hotel.image.medium,

                                    "address": hotel.address,
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
