import 'package:get_it/get_it.dart';

import 'package:offline_mode_first_app/services/api_service.dart';
import 'package:offline_mode_first_app/services/sembast_service.dart';

final getIt = GetIt.instance;

class Services {
  void init() {
    getIt.allowReassignment = true;

    getIt.registerSingleton<ApiService>(ApiService());
    getIt.registerSingleton<SembastService>(SembastService());
  }
}
