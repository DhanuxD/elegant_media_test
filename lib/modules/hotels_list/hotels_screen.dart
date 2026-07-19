import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/app_error_widgets/app_error.dart';
import '../../widgets/cards/app_card_view.dart';
import '../../widgets/empty_space/app_empty.dart';
import '../../widgets/info_row/app_info_row.dart';
import '../../widgets/labels/app_labels.dart';
import '../../widgets/loading_widget/app_loading.dart';
import '../../widgets/network_image/app_network_image.dart';
import 'hotels_controller.dart';

class HotelsScreen extends StatelessWidget {
  HotelsScreen({super.key});

  final HotelsController controller = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'TravelX') ,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoading();
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return AppError(
            message: controller.errorMessage.value,
          );
        }

        if (controller.hotels.isEmpty) {
          return const AppEmpty(
            message: "No Hotels Found",
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchHotels,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.hotels.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final hotel = controller.hotels[index];

              return AppCard(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.HOTELDETAILSSCREEN,
                    arguments: hotel,
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppNetworkImage(
                      imageUrl: hotel.image.medium,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLabel(
                            text: hotel.title,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                          ),

                          const SizedBox(height: 10),

                          AppLabel(
                            text: hotel.description,
                            maxLines: 3,
                          ),

                          const Divider(height: 30),

                          AppInfoRow(
                            icon: Icons.location_on,
                            value: hotel.address,
                          ),

                          AppInfoRow(
                            icon: Icons.phone,
                            value: hotel.phoneNumber,
                          ),

                          AppInfoRow(
                            icon: Icons.pin_drop,
                            value:
                            "${hotel.latitude}, ${hotel.longitude}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}