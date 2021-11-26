import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://fipe.contrateumdev.com.br//api';
  }
}
