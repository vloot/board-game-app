import 'package:board_game_app/features/settings/domain/entities/app_theme_entity.dart';
import 'package:board_game_app/features/shared/time_format.dart';
import 'package:flutter/widgets.dart';

class AppSettingsEntity {
  final AppBrightness appBrightness;
  final AppThemeEntity theme;
  final Locale locale;
  final TimeFormat timeFormat;

  AppSettingsEntity({
    required this.appBrightness,
    required this.theme,
    required this.locale,
    required this.timeFormat,
  });

  AppSettingsEntity copyWith({
    AppBrightness? appBrightness,
    AppThemeEntity? theme,
    Locale? locale,
    TimeFormat? timeFormat,
  }) {
    return AppSettingsEntity(
      appBrightness: appBrightness ?? this.appBrightness,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      timeFormat: timeFormat ?? this.timeFormat,
    );
  }
}

enum AppBrightness { system, light, dark, custom }
