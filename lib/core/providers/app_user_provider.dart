import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/typedefs.dart';
import '../data/models/app_user_model.dart';
import '../services/api_service.dart';
import 'global_providers.dart';

part 'app_user_provider.g.dart';

@riverpod
Future<AppUser?> appUser(Ref ref) async {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) {
    return null;
  }
  final DocumentSnapshot<Map<String, dynamic>> doc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  if (!doc.exists) return null;
  final Map<String, dynamic>? data = doc.data();
  final String? customId = data?['customId'] as String?;

  // Use id to get the user from the API

  final ApiService apiService = ref.watch(apiServiceProvider);
  final Response<JSON> response = await apiService.request<JSON>(
    '/user',
    method: HttpMethod.get,
  );
  if (response.data != null) {
    return AppUser.fromJson(response.data!);
  }
  return null;
}
