part of 'auth_notifier.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props;

  LoggedIn? get loggedInState =>
      switch (this) { final LoggedIn val => val, _ => null };

  bool isLoggedIn() => this is LoggedIn;

  T? when<T>({
    T Function(LoggedOut)? signedOut,
    T Function(LoggedIn)? authenticated,
  }) {
    return switch (this) {
      final LoggedOut val => signedOut?.call(val),
      final LoggedIn val => authenticated?.call(val),
    };
  }
}

@immutable
class LoggedOut extends AuthState {
  const LoggedOut();

  @override
  List<Object?> get props => <Object>[];
}

@immutable
class LoggedIn extends AuthState {
  const LoggedIn(this.route);

  // final User user;
  final AppRoute route;

  @override
  List<Object> get props => <Object>[route];
}
