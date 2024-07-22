import 'package:dio/dio.dart';

import 'package:offline_mode_first_app/services/index.dart';
import 'package:offline_mode_first_app/services/sembast_service.dart';
import 'package:sembast/sembast.dart';

class ApiService {
  final dio = Dio();

  Future<String> getHello() async {
    final response = await dio.get('http://localhost:3000');

    await getIt<SembastService>().store.record('hello').put(getIt<SembastService>().db, response.data);

    return response.data;
  }
}
