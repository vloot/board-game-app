import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/board_games/data/board_game_datasource.dart';
import 'package:board_game_app/features/board_games/data/board_game_repo_impl.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/players/data/players_datasource.dart';
import 'package:board_game_app/features/players/data/players_repository_impl.dart';
import 'package:board_game_app/features/players/domain/players_repository.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/session/data/session_repository_impl.dart';
import 'package:board_game_app/features/session/domain/session_repository.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_bloc.dart';
import 'package:board_game_app/features/settings/data/repository/app_settings_repository_impl.dart';
import 'package:board_game_app/features/settings/domain/repository/app_settings_repository.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

Future<void> setupDI() async {
  // Settings
  getIt.registerSingletonAsync<AppSettingsRepository>(() async {
    final repo = AppSettingsRepositoryImpl();
    await repo.init();
    return repo;
  });

  getIt.registerSingletonAsync<AppSettingsBloc>(() async {
    final repo = await getIt.getAsync<AppSettingsRepository>();
    final initialSettings = await repo.load();

    return AppSettingsBloc(repo, settings: initialSettings);
  }, dependsOn: [AppSettingsRepository]);

  getIt.registerSingleton(Database());

  // Board game
  getIt.registerLazySingleton(() => BoardGameDatasource(getIt<Database>()));
  getIt.registerLazySingleton<BoardGameRepo>(
    () => BoardGameRepoImpl(getIt<BoardGameDatasource>()),
  );
  getIt.registerFactory(() => BoardGameBloc(getIt()));

  // Player
  getIt.registerLazySingleton(() => PlayerDatasource(getIt<Database>()));
  getIt.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(getIt<PlayerDatasource>()),
  );
  getIt.registerFactory(() => PlayerBloc(getIt<PlayerRepository>()));

  // Session
  getIt.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(
      playerRepo: getIt<PlayerRepository>(),
      gameRepo: getIt<BoardGameRepo>(),
    ),
  );
  getIt.registerFactory(() => SessionFormBloc(getIt()));

  await getIt.allReady();
}
