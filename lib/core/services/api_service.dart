import 'dart:async';
import 'dart:convert' show json;
import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../app/typedefs.dart';

export 'package:dio/dio.dart' show CancelToken, Options, Response;

enum HttpMethod { get, post, put, patch, delete }

final class ApiService {
  ApiService({
    required Dio dio,
    Iterable<Interceptor> interceptors = const <Interceptor>[],
    HttpClientAdapter? httpClientAdapter,
  }) : _dio = dio {
    _dio.transformer = BackgroundTransformer()
      ..jsonDecodeCallback = _decodeJson;
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
    _dio.interceptors.addAll(interceptors);
    _dio.options = _dio.options.copyWith(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 30),
    );
  }

  final Dio _dio;

  FutureOr<Object?> _decodeJson(String text, [int sizeKb = 50]) async {
    if (text.codeUnits.length < sizeKb * 1024) return json.decode(text);
    return Isolate.run<Object?>(() => json.decode(text), debugName: 'decoder');
  }

  Future<Response<R>> request<R>(
    String endpoint, {
    required HttpMethod method,
    Object? data,
    JSON? queryParams,
    Options? options,
    CancelToken? cancelToken,
    void Function(double)? onSendProgress,
    void Function(double)? onReceiveProgress,
  }) async {
    final Response<R> response = switch (method) {
      HttpMethod.get => await _dio.get<R>(
          endpoint,
          queryParameters: queryParams,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress != null
              ? (int received, int total) => onReceiveProgress(received / total)
              : null,
        ),
      HttpMethod.post => await _dio.post<R>(
          endpoint,
          data: data,
          queryParameters: queryParams,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress != null
              ? (int sent, int total) => onSendProgress(sent / total)
              : null,
          onReceiveProgress: onReceiveProgress != null
              ? (int received, int total) => onReceiveProgress(received / total)
              : null,
        ),
      HttpMethod.put => await _dio.put<R>(
          endpoint,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress != null
              ? (int sent, int total) => onSendProgress(sent / total)
              : null,
          onReceiveProgress: onReceiveProgress != null
              ? (int received, int total) => onReceiveProgress(received / total)
              : null,
        ),
      HttpMethod.patch => await _dio.patch<R>(
          endpoint,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress != null
              ? (int sent, int total) => onSendProgress(sent / total)
              : null,
          onReceiveProgress: onReceiveProgress != null
              ? (int received, int total) => onReceiveProgress(received / total)
              : null,
        ),
      HttpMethod.delete => await _dio.delete<R>(
          endpoint,
          data: data,
          options: options,
          cancelToken: cancelToken,
        ),
    };

    return response;
  }
}
