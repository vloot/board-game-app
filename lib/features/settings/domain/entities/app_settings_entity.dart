import 'package:board_game_app/features/settings/domain/entities/app_theme_entity.dart';
import 'package:flutter/widgets.dart';

class AppSettingsEntity {
  final AppBrightness appBrightness;
  final AppThemeEntity theme;
  final Locale locale;

  AppSettingsEntity({
    required this.appBrightness,
    required this.theme,
    required this.locale,
  });

  AppSettingsEntity copyWith({
    AppBrightness? appBrightness,
    AppThemeEntity? theme,
    Locale? locale,
  }) {
    return AppSettingsEntity(
      appBrightness: appBrightness ?? this.appBrightness,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }
}

enum AppBrightness { system, light, dark, custom }
