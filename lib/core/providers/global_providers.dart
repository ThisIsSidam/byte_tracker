import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../configurations/configs.dart';
import '../services/api_service.dart';
import '../services/auth_interceptor.dart';

part 'global_providers.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) {
  final Dio dio = Dio(BaseOptions(baseUrl: Configs.baseURL1));
  ref.onDispose(dio.close);
  return ApiService(
    dio: dio,
    interceptors: <Interceptor>[
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(ref),
    ],
  );
}
