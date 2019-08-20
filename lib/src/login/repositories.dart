import 'package:dio/dio.dart';

import 'package:login/src/utils/constants.dart';

class AuthRepository {
  Dio client;
  final String baseUrl = Configs.apiUrl;

  AuthRepository() {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    this.client = Dio(options);
  }

  login(String email, String password) async {
    String endpoint = '/login';
    Map <String, String> payload = {
      "email": email,
      "password": password,
    };
    print(payload);
    print(baseUrl);
    try {
      Response response = await client.post(endpoint, data: payload);
      return response;
    } catch (e) {
      print(e);
    }
  }

  refresh() async {
    String endpoint = '/refresh';
    Response response = await client.post(endpoint, data: {});
    return response;
  }

  logout() {
    print('call the endpoint to put token on blacklist');
  }
}