import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/typedefs.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../../core/services/api_service.dart';

part 'connect_bank_provider.g.dart';

@riverpod
Future<bool> connectToBank(
  Ref ref,
  String firstName,
  String lastName,
  String aadhaar,
) async {
  try {
    final ApiService apiService = ref.read(apiServiceProvider);

    final String? email = FirebaseAuth.instance.currentUser?.email;
    if (email == null) {
      throw Exception('User is not logged in');
    }
    final Map<String, dynamic> body = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'aadharId': aadhaar,
    };
    final Response<JSON> response = await apiService.request<JSON>(
      method: HttpMethod.post,
      '/api/',
      data: body,
    );
    String? backendId;
    if (response.data != null) {
      backendId = response.data!['id'] as String;
    }

    // Save the backendId to Firestore
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    await FirebaseFirestore.instance.collection('users').doc(userId).set(
      <String, dynamic>{'backendId': backendId},
      SetOptions(merge: true),
    );
  } catch (e) {
    log('Error connecting to bank: $e');
    return false;
  }
  return true;
}
