import 'package:elegant_media/modules/settings/settings_screen.dart';
import 'package:get/get.dart';

import '../bindings/app_binding.dart';
import '../modules/hotel_details/hotel_details_screen.dart';
import '../modules/hotels_list/hotels_screen.dart';
import '../modules/login/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.LOGINSCREEN,
      page: () => LoginScreen(),
      binding: AppBinding(),
    ),
    GetPage(name: AppRoutes.HOTELSSCREEN, page: () => HotelsScreen()),
    GetPage(name: AppRoutes.HOTELDETAILSSCREEN, page: () => HotelDetailsScreen()),
    GetPage(name: AppRoutes.SETTINGSSCREEN, page: () => SettingsScreen()),
    GetPage(
      name: AppRoutes.HOTELDETAILSSCREEN,
      page: () => HotelDetailsScreen(),
      binding: AppBinding(),
    ),
  ];
}
