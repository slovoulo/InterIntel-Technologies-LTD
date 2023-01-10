import 'package:dio/dio.dart';


import 'API/endpoints.dart';
import 'DioServices/dioClient.dart';

class dioFetchService extends dioClient {
  dioClient _client = new dioClient();

  Future<Response> fetchTodos() async {
    try {
      return await _client
          .init()
          .get(ApiEndPoints.TODOS_URL);
    } on DioError catch (ex) {
      throw new Exception(ex);
    }
  }
}
