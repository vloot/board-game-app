import 'package:board_game_app/features/settings/data/models/app_theme_model.dart';
import 'package:board_game_app/features/settings/data/storage/app_settings_keys.dart';
import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:board_game_app/features/shared/time_format.dart';
import 'package:flutter/material.dart';

class AppSettingsModel {
  final int appBrightness;
  final int timeFormatIndex;
  final AppThemeModel theme;
  final String locale;

  static final defaultSettings = AppSettingsModel(
    appBrightness: AppBrightness.light.index,
    timeFormatIndex: TimeFormat.h24.index,
    theme: AppThemeModel.defaultSettingsLight,
    locale: "en",
  );

  AppSettingsModel({
    required this.appBrightness,
    required this.timeFormatIndex,
    required this.theme,
    required this.locale,
  });

  /// MODEL → ENTITY
  AppSettingsEntity toEntity() {
    return AppSettingsEntity(
      appBrightness: AppBrightness.values[appBrightness],
      timeFormat: TimeFormat.values[timeFormatIndex],
      theme: theme.toEntity(),
      locale: Locale(locale),
    );
  }

  /// ENTITY → MODEL
  factory AppSettingsModel.fromEntity(AppSettingsEntity e) {
    return AppSettingsModel(
      appBrightness: e.appBrightness.index,
      timeFormatIndex: e.timeFormat.index,
      theme: AppThemeModel.fromEntity(e.theme),
      locale: e.locale.languageCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppSettingsKeys.themeType: appBrightness,
      AppSettingsKeys.timeFormat: timeFormatIndex,
      AppSettingsKeys.themeSettings: theme.toJson(),
      AppSettingsKeys.locale: locale,
    };
  }

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      appBrightness: json[AppSettingsKeys.themeType],
      timeFormatIndex: json[AppSettingsKeys.timeFormat],
      theme: AppThemeModel.fromJson(
        json[AppSettingsKeys.themeSettings] as Map<String, dynamic>,
      ),
      locale: json[AppSettingsKeys.locale],
    );
  }
}
