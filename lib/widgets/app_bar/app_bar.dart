import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme_manager.dart';
import '../labels/app_labels.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final List<Widget>? actions;

  final bool centerTitle;

  CustomAppBar({
    super.key,

    required this.title,

    this.actions,

    this.centerTitle = true,
  });

  final AppThemeManager themeManager = Get.find<AppThemeManager>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        centerTitle: centerTitle,

        backgroundColor: themeManager.primary,

        foregroundColor: Colors.white,

        elevation: 0,

        title: AppLabel(
          text: title,

          color: Colors.white,

          fontSize: 20,

          fontWeight: FontWeight.bold,
        ),

        actions:
            actions ??
            [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                ),

                onPressed: () {
                  Get.toNamed('/settings');
                },
              ),
            ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
