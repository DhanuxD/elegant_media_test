import 'package:elegant_media/modules/settings/setings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme_manager.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/labels/app_labels.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final AppThemeManager themeManager = Get.find<AppThemeManager>();
  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _settingsCard(
              icon: Icons.person,
              title: "Profile",
              subtitle: "View your profile details",
              onTap: () {
                // Later navigate profile
              },
            ),

            const SizedBox(height: 16),

            _settingsCard(
              icon: Icons.logout,
              title: "Logout",
              subtitle: "Sign out from application",
              onTap: () {
                // Later AuthService logout
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: themeManager.background,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: AppLabel(text: title, fontSize: 17, fontWeight: FontWeight.bold),
        subtitle: AppLabel(text: subtitle, fontSize: 14),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _themeOption(String name, ThemeType type) {
    return ListTile(
      title: Text(name),
      onTap: () {
        controller.changeTheme(type);
        Get.back();
      },
    );
  }
}
