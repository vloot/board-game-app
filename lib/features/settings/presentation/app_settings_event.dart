import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:flutter/material.dart';

abstract class AppSettingsEvent {}

class LoadAppSettings extends AppSettingsEvent {
  late AppSettingsEntity loadedSettings;
}

class UpdateAppSettings extends AppSettingsEvent {
  final AppSettingsEntity updated;
  UpdateAppSettings(this.updated);
}

class LocaleChanged extends AppSettingsEvent {
  final Locale locale;
  LocaleChanged(this.locale);
}
