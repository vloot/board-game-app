import 'package:board_game_app/features/settings/domain/entities/app_theme_entity.dart';
import 'package:flutter/material.dart';

class AppThemeModel {
  final int primaryColor;
  final int primaryColorAccent;
  final int secondaryColor;
  final int secondaryColorAccent;
  final int activeColor;
  final int inactiveColor;
  final int warningColor;
  final int backgroundColor;
  final int backgroundOverlayColor;
  final int textColor;
  final int transparent;
  final int shadowColor;

  AppThemeModel({
    required this.primaryColor,
    required this.primaryColorAccent,
    required this.secondaryColor,
    required this.secondaryColorAccent,
    required this.activeColor,
    required this.inactiveColor,
    required this.warningColor,
    required this.backgroundColor,
    required this.backgroundOverlayColor,
    required this.textColor,
    required this.transparent,
    required this.shadowColor,
  });

  static final defaultSettingsDark = AppThemeModel(
    primaryColor: 0xAEF78E,
    primaryColorAccent: 0x66A182,
    secondaryColor: 0x9FA0C3,
    secondaryColorAccent: 0xA18276,
    activeColor: const Color.fromARGB(255, 51, 118, 53).toARGB32(),
    inactiveColor: Colors.blueGrey.toARGB32(),
    warningColor: Colors.redAccent.toARGB32(),
    backgroundColor: Colors.black.toARGB32(),
    backgroundOverlayColor: const Color.fromARGB(255, 20, 20, 20).toARGB32(),
    textColor: 0x2E4057,
    transparent: Colors.transparent.toARGB32(),
    shadowColor: Colors.black54.toARGB32(),
  );

  static final defaultSettingsLight = AppThemeModel(
    primaryColor: Color.fromARGB(255, 174, 247, 142).toARGB32(),
    primaryColorAccent: Color.fromARGB(255, 102, 161, 130).toARGB32(),
    secondaryColor: Color.fromARGB(255, 159, 160, 195).toARGB32(),
    secondaryColorAccent: Color.fromARGB(255, 161, 130, 118).toARGB32(),
    activeColor: Colors.green.toARGB32(),
    inactiveColor: Colors.blueGrey.toARGB32(),
    warningColor: Colors.redAccent.toARGB32(),
    backgroundColor: Color.fromARGB(255, 247, 253, 242).toARGB32(),
    backgroundOverlayColor: Color.fromARGB(255, 253, 243, 242).toARGB32(),
    textColor: Color.fromARGB(255, 46, 64, 87).toARGB32(),
    transparent: Colors.transparent.toARGB32(),
    shadowColor: Colors.black45.toARGB32(),
  );

  // Model → Entity
  AppThemeEntity toEntity() {
    return AppThemeEntity(
      primaryColor: primaryColor,
      primaryColorAccent: primaryColorAccent,
      secondaryColor: secondaryColor,
      secondaryColorAccent: secondaryColorAccent,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      warningColor: warningColor,
      backgroundColor: backgroundColor,
      backgroundOverlayColor: backgroundOverlayColor,
      textColor: textColor,
      transparent: transparent,
      shadowColor: shadowColor,
    );
  }

  // Entity → Model
  factory AppThemeModel.fromEntity(AppThemeEntity entity) {
    return AppThemeModel(
      primaryColor: entity.primaryColor,
      primaryColorAccent: entity.primaryColorAccent,
      secondaryColor: entity.secondaryColor,
      secondaryColorAccent: entity.secondaryColorAccent,
      activeColor: entity.activeColor,
      inactiveColor: entity.inactiveColor,
      warningColor: entity.warningColor,
      backgroundColor: entity.backgroundColor,
      backgroundOverlayColor: entity.backgroundOverlayColor,
      textColor: entity.textColor,
      transparent: entity.transparent,
      shadowColor: entity.shadowColor,
    );
  }

  Map<String, dynamic> toJson() => {
    'primaryColor': primaryColor,
    'primaryColorAccent': primaryColorAccent,
    'secondaryColor': secondaryColor,
    'secondaryColorAccent': secondaryColorAccent,
    'activeColor': activeColor,
    'inactiveColor': inactiveColor,
    'warningColor': warningColor,
    'backgroundColor': backgroundColor,
    'backgroundOverlayColor': backgroundOverlayColor,
    'textColor': textColor,
    'transparent': transparent,
    'shadowColor': shadowColor,
  };

  factory AppThemeModel.fromJson(Map<String, dynamic> json) {
    return AppThemeModel(
      primaryColor: json['primaryColor'] as int,
      primaryColorAccent: json['primaryColorAccent'] as int,
      secondaryColor: json['secondaryColor'] as int,
      secondaryColorAccent: json['secondaryColorAccent'] as int,
      activeColor: json['activeColor'] as int,
      inactiveColor: json['inactiveColor'] as int,
      warningColor: json['warningColor'] as int,
      backgroundColor: json['backgroundColor'] as int,
      backgroundOverlayColor: json['backgroundOverlayColor'] as int,
      textColor: json['textColor'] as int,
      transparent: json['transparent'] as int,
      shadowColor: json['shadowColor'] as int,
    );
  }
}
