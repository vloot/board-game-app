import 'package:board_game_app/features/settings/data/models/app_theme_model.dart';
import 'package:board_game_app/features/settings/data/storage/app_settings_keys.dart';
import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:flutter/material.dart';

class AppSettingsModel {
  final int appBrightness;
  final AppThemeModel theme;
  final String locale;

  static final defaultSettings = AppSettingsModel(
    appBrightness: AppBrightness.light.index,
    theme: AppThemeModel.defaultSettingsLight,
    locale: "en",
  );

  AppSettingsModel({
    required this.appBrightness,
    required this.theme,
    required this.locale,
  });

  /// MODEL → ENTITY
  AppSettingsEntity toEntity() {
    return AppSettingsEntity(
      appBrightness: AppBrightness.values[appBrightness],
      theme: theme.toEntity(),
      locale: Locale(locale),
    );
  }

  /// ENTITY → MODEL
  factory AppSettingsModel.fromEntity(AppSettingsEntity e) {
    return AppSettingsModel(
      appBrightness: e.appBrightness.index,
      theme: AppThemeModel.fromEntity(e.theme),
      locale: e.locale.languageCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppSettingsKeys.themeType: appBrightness,
      AppSettingsKeys.themeSettings: theme.toJson(),
      AppSettingsKeys.locale: locale,
    };
  }

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      appBrightness: json[AppSettingsKeys.themeType],
      theme: AppThemeModel.fromJson(
        json[AppSettingsKeys.themeSettings] as Map<String, dynamic>,
      ),
      locale: json[AppSettingsKeys.locale],
    );
  }
}
