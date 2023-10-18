import 'package:dio/dio.dart';
import 'package:flutter_mockito/contracts/http_service_contract.dart';

class HttpService extends HttpServiceContract {
  @override
  Future<Response<T>> request<T>(
    String url, {
    required String method,
    Map<String, dynamic>? queryString,
    Object? data,
  }) {
    return Dio().request<T>(
      url,
      data: data,
      queryParameters: queryString,
    );
  }
}
