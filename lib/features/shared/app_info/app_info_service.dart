import 'package:board_game_app/features/shared/app_info/app_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoService {
  Future<AppInfo> load() async {
    final info = await PackageInfo.fromPlatform();
    return AppInfo(version: info.version, build: info.buildNumber);
  }
}
