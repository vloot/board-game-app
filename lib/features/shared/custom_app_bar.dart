import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.settings, required this.title});

  final AppSettingsEntity settings;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: Color(settings.theme.secondaryColor),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 26,
          color: Color(settings.theme.secondaryColor),
        ),
      ),
      backgroundColor: Color(settings.theme.primaryColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
