import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../modules/hotels_list/hotels_controller.dart';
import '../modules/login/login_controller.dart';
import '../modules/settings/setings_controller.dart';
import '../theme/app_theme_manager.dart';


class AppBinding extends Bindings {

  @override
  void dependencies() {


    // ==========================
    // Services
    // ==========================

    Get.put(
      AuthService(),
      permanent: true,
    );



    // ==========================
    // Theme
    // ==========================

    Get.put(
      AppThemeManager(),
      permanent: true,
    );



    // ==========================
    // Controllers
    // ==========================

    Get.lazyPut<LoginController>(
          () => LoginController(),
      fenix: true,
    );


    Get.lazyPut<HotelsController>(
          () => HotelsController(),
      fenix: true,
    );


    Get.lazyPut<SettingsController>(
          () => SettingsController(),
      fenix: true,
    );


  }

}