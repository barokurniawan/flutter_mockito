import 'package:dio/dio.dart';

abstract class HttpServiceContract {
  Future<Response<T>> request<T>(
    String url, {
    required String method,
    Map<String, dynamic>? queryString,
    Object? data,
  });
}
