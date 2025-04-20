import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

@riverpod
Future<String?> userIdFromFirebase(Ref ref) async {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) {
    return null;
  }
  final DocumentSnapshot<Map<String, dynamic>> doc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  if (!doc.exists) return null;
  final Map<String, dynamic>? data = doc.data();
  return data?['backendId'] as String?;
}
