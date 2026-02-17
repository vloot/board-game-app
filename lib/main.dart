import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/dashboard/dashboard.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/settings/domain/entities/app_settings_entity.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AppSettingsBloc>()),
        BlocProvider(create: (_) => getIt<BoardGameBloc>()),
        BlocProvider(create: (_) => getIt<PlayerBloc>()),
      ],
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(state.settings.theme.primaryColor),
                brightness: state.settings.appBrightness == AppBrightness.light
                    ? Brightness.light
                    : Brightness.dark,
              ),
            ),
            home: Dashboard(),
          );
        },
      ),
    ),
  );
}
