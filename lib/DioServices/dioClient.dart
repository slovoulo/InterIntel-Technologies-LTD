import "package:dio/dio.dart";
import 'package:fluttertoast/fluttertoast.dart';

import '../API/baseurl.dart';


class dioClient {
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(new ApiInterceptors());
  //  _dio.interceptors.add(new LoggingInterceptor());
    _dio.transformer as DefaultTransformer; //.jsonDecodeCallback = parseJson;
    _dio.options.baseUrl = BaseURL.Baseurl;



    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String contentType;

    options.method == 'PATCH'
        ? contentType = 'application/json-patch+json'
        : contentType = 'application/json';

    var customHeaders = {
      'content-type': contentType,
     // 'Authorization': 'Bearer $TOKEN'
    };

    options.headers.addAll(customHeaders);

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        '## ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
