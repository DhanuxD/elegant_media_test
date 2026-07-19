import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../data/services/auth_service.dart';
import '../modules/hotel_details/hotels_controller.dart';
import '../modules/login/login_controller.dart';


class AppBinding extends Bindings {

  @override
  void dependencies() {


    Get.put(AuthService(), permanent: true);


    Get.lazyPut<LoginController>(
          ()=>LoginController(),
      fenix:true,
    );


    Get.lazyPut<HotelsController>(
          ()=>HotelsController(),
      fenix:true,
    );


    Get.lazyPut<HotelsController>(
          () => HotelsController(),
    );


  }

}