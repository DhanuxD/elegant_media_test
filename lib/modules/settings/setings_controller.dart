import 'package:get/get.dart';

import '../../theme/app_theme_manager.dart';


class SettingsController extends GetxController {


  final AppThemeManager themeManager =
  Get.find<AppThemeManager>();



  void changeTheme(ThemeType theme) {

    themeManager.changeTheme(theme);

  }


}