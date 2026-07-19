import 'package:get/get.dart';
import '../bindings/app_binding.dart';
import '../modules/hotel_details/hotels_screen.dart';
import '../modules/login/login_screen.dart';
import 'app_routes.dart';


class AppPages {


  static final routes = [

    GetPage(
      name: AppRoutes.LOGIN,
      page: ()=> LoginScreen(),
      binding: AppBinding() ,
    ) ,

    GetPage(
      name: AppRoutes.HOTELS,
      page: () => HotelsScreen(),
    ),

  ];

}