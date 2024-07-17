import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future<String> getHello() async {
    final response = await dio.get('http://localhost:3000');

    return response.data;
  }
}