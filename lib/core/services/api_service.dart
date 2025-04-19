import 'dart:async';
import 'dart:convert' show json;
import 'dart:isolate';

import 'package:byte_tracker/app/typedefs.dart';
import 'package:dio/dio.dart';

export 'package:dio/dio.dart' show CancelToken, Options, Response;

/// Enum representing HTTP methods.
enum HttpMethod { get, post, put, patch, delete }

/// A service class that wraps the [Dio] instance and provides methods for
/// basic network requests.
final class ApiService {
  /// A public constructor that is used to create a Dio service and initialize
  /// the underlying [Dio] client.
  ///
  /// * [interceptors]: An [Iterable] for attaching custom
  /// [Interceptor]s to the underlying [_dio] client.
  /// * [httpClientAdapter]: Replaces the underlying [HttpClientAdapter] with
  /// this custom one.
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

  /// An instance of [Dio] for executing network requests.
  final Dio _dio;

  /// Decode response data in a background isolate to prevent UI jank.
  FutureOr<Object?> _decodeJson(String text, [int sizeKb = 50]) async {
    if (text.codeUnits.length < sizeKb * 1024) return json.decode(text);
    return Isolate.run<Object?>(() => json.decode(text), debugName: 'decoder');
  }

  /// A generalized request method that supports different HTTP methods.
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
