import 'package:dio/dio.dart';

abstract class HttpContract {
  Future<Response<T>> request<T>(
    String url, {
    required String method,
    Map<String, dynamic>? queryString,
    Object? data,
  });
}
