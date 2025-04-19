import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' show IdTokenResult, User;
import 'package:riverpod/riverpod.dart';

import '../../features/authentication/presentation/providers/auth_notifier.dart';

// import '../../features/authentication/presentation/providers/auth_notifier.dart';

/// Custom Interceptor class that extends the [Interceptor] class from the
/// [Dio] package. This adds the firebase app check to the request headers.
/// also adds the firebase id token to the request headers.
class AuthInterceptor extends QueuedInterceptor {
  factory AuthInterceptor(Ref ref) => AuthInterceptor._(ref);

  AuthInterceptor._(this.ref);

  final Ref ref;
  static IdTokenResult? _cache;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['x-client-device'] = 'app';
    final String? bearerToken = await _getToken();
    if (bearerToken != null) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $bearerToken');
      handler.next(options);
    } else {
      // handler.reject(
      //   DioException(requestOptions: options, error: 'Session Expired'),
      // );
      handler.next(options);
    }
  }

  /// Force refresh the token or return the cached token if it is still valid
  Future<String?> _getToken() async {
    if (_cache != null && _isValid(_cache!)) return _cache?.token;
    final User? user = await ref.read(authStreamProvider.future);
    _cache = await user?.getIdTokenResult();
    return _cache?.token;
  }

  /// Invalidate cache on logout
  void invalidateCache() => _cache = null;

  /// Whether the token should be refreshed or not
  bool _isValid(IdTokenResult token) {
    return token.expirationTime?.isAfter(DateTime.now()) ?? false;
  }
}
