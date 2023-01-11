import "package:dio/dio.dart";

import '../API/baseurl.dart';

class dioClient {
  Dio init() {
    Dio _dio = new Dio();

    _dio.options.baseUrl = BaseURL.Baseurl;

    return _dio;
  }
}
