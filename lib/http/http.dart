import 'package:dio/dio.dart';
import 'package:login/http/interceptors.dart';
import 'package:login/storages/storages.dart';

class CustomHttp extends Dio {

  CustomHttp(String baseUrl, Storage storage) {
    options.baseUrl = baseUrl;

    CustomInterceptors refreshFlow = CustomInterceptors(this, storage);
    interceptors.add(refreshFlow);
  }
}