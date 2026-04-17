import 'package:board_game_app/features/settings/data/models/app_theme_model.dart';
import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_event.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/settings/presentation/widgets/settings_section.dart';
import 'package:board_game_app/features/settings/presentation/widgets/settings_toggle.dart';
import 'package:board_game_app/features/shared/app_info/app_info.dart';
import 'package:board_game_app/features/shared/app_info/app_info_service.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppInfoService appInfoService = AppInfoService();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      bloc: context.read<AppSettingsBloc>(),
      builder: (context, settingsState) {
        final l10n = AppLocalizations.of(context)!;
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(settingsState.settings.theme.secondaryColor),
            ),
            title: Text(
              l10n.settings,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Color(settingsState.settings.theme.secondaryColor),
              ),
            ),
            backgroundColor: Color(settingsState.settings.theme.primaryColor),
          ),
          backgroundColor: Color(settingsState.settings.theme.backgroundColor),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsSection(
                      sectionTitle: l10n.settingsCustomization,
                      settingsState: settingsState,
                      settingsEntries: [
                        SettingsToggle<AppBrightness, Widget>(
                          initValue: settingsState.settings.appBrightness,
                          segmentsMap: {
                            AppBrightness.dark: IconToggle(
                              color: Colors.blueGrey,
                              iconData: Icons.dark_mode_sharp,
                            ),
                            AppBrightness.light: IconToggle(
                              color: Colors.limeAccent,
                              iconData: Icons.light_mode_sharp,
                            ),
                          },
                          iconData: Icons.palette_sharp,
                          settingName: l10n.settingsTheme,
                          onSelectionChanged: (AppBrightness selected) {
                            context.read<AppSettingsBloc>().add(
                              UpdateAppSettings(
                                settingsState.settings.copyWith(
                                  appBrightness: selected,
                                  theme:
                                      (selected == AppBrightness.dark
                                              ? AppThemeModel
                                                    .defaultSettingsDark
                                              : AppThemeModel
                                                    .defaultSettingsLight)
                                          .toEntity(),
                                ),
                              ),
                            );
                          },
                        ),
                        SettingsCustomLine(
                          settingsState: settingsState,
                          settingName: l10n.settingsLang,
                          iconData: Icons.translate_sharp,
                          content: DropdownButton(
                            value: settingsState.settings.locale,
                            items: [
                              DropdownMenuItem(
                                value: Locale('en'),
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    color: Color(
                                      context
                                          .read<AppSettingsBloc>()
                                          .state
                                          .settings
                                          .theme
                                          .textColor,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: Locale('uk'),
                                child: Text(
                                  'Українська',
                                  style: TextStyle(
                                    color: Color(
                                      context
                                          .read<AppSettingsBloc>()
                                          .state
                                          .settings
                                          .theme
                                          .textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<AppSettingsBloc>().add(
                                  LocaleChanged(value),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SettingsSection(
                      sectionTitle: l10n.settingsAbout,
                      settingsState: settingsState,
                      settingsEntries: [
                        SettingsCustomLine(
                          iconData: Icons.code_sharp,
                          settingName: l10n.settingsSourceCode,
                          content: ElevatedButton(
                            onPressed: () async {
                              try {
                                final repo = dotenv.get(
                                  "REPO_URL",
                                  fallback: "",
                                );
                                await launchUrl(Uri.parse(repo));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l10n.error)),
                                );
                              }
                            },
                            child: Text(l10n.settingsOpenRepo),
                          ),
                          settingsState: settingsState,
                        ),
                        SettingsCustomLine(
                          iconData: Icons.numbers_sharp,
                          settingName: l10n.settingsAppVersion,
                          content: FutureBuilder<AppInfo>(
                            future: appInfoService.load(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox.shrink();
                              return Text(
                                snapshot.data!.version,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(
                                    settingsState.settings.theme.textColor,
                                  ),
                                ),
                              );
                            },
                          ),
                          settingsState: settingsState,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsCustomLine extends StatelessWidget {
  const SettingsCustomLine({
    super.key,
    required this.iconData,
    required this.settingName,
    required this.content,
    required this.settingsState,
  });

  final IconData iconData;
  final String settingName;
  final Widget content;
  final AppSettingsState settingsState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Color(
          context.read<AppSettingsBloc>().state.settings.theme.textColor,
        ),
      ),
      title: Text(
        settingName,
        style: TextStyle(
          color: Color(
            context.read<AppSettingsBloc>().state.settings.theme.textColor,
          ),
        ),
      ),
      trailing: content,
    );
  }
}

class IconToggle extends StatelessWidget {
  final Color color;
  final IconData iconData;

  const IconToggle({super.key, required this.color, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: 22,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(blurRadius: 30, color: Colors.black26, offset: Offset(1, 1)),
      ],
    );
  }
}
