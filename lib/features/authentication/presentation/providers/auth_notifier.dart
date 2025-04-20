import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/router/router.dart';
import '../../../../core/services/auth_interceptor.dart';

part 'auth_notifier.g.dart';
part 'auth_state.dart';

@riverpod
Stream<User?> authStream(Ref ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthState> build() async {
    final User? firebaseUser =
        await ref.read(authStreamProvider.selectAsync((User? user) => user));
    if (firebaseUser == null) return const LoggedOut();
    return const LoggedIn(AppRoute.dashboardHome);
  }

  Future<void> signIn(String email, String pwd) async {
    final AsyncValue<AuthState> previous = state.unwrapPrevious();
    state = const AsyncLoading<AuthState>().copyWithPrevious(previous);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      state = const AsyncData<AuthState>(LoggedIn(AppRoute.dashboardHome));
    } on FirebaseAuthException catch (e, stk) {
      state = AsyncError<AuthState>(e, stk).copyWithPrevious(previous);
    } catch (e, stk) {
      state = AsyncError<AuthState>(e, stk).copyWithPrevious(previous);
    }
  }

  Future<bool> signUp() async {
    return false;
  }

  Future<void> signOut() async {
    final AsyncValue<AuthState> previous = state.unwrapPrevious();
    try {
      await FirebaseAuth.instance.signOut();
      AuthInterceptor(ref).invalidateCache();
      state = const AsyncData<AuthState>(LoggedOut());
    } catch (e, stk) {
      state = AsyncError<AuthState>(e, stk).copyWithPrevious(previous);
    }
  }
}
