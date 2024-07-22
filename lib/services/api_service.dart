import 'package:dio/dio.dart';

import 'package:offline_mode_first_app/services/index.dart';
import 'package:offline_mode_first_app/services/sembast_service.dart';
import 'package:sembast/sembast.dart';

class ApiService {
  final dio = Dio();

  Stream<String> getHello() async* {
    final storedData = await getIt<SembastService>().store.record('hello').get(getIt<SembastService>().db) as String;

    yield storedData;

    final response = await dio.get('http://localhost:3000');

    await getIt<SembastService>().store.record('hello').put(getIt<SembastService>().db, response.data);

    yield response.data;
  }
}
