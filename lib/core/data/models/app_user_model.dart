import '../../../app/typedefs.dart';

class AppUser {
  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.grossAmount,
    required this.alertOnRemaining,
    required this.limitForDay,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id_'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      grossAmount: json['gross_amount'] as double,
      alertOnRemaining: json['alertOnRemaining'] as double,
      limitForDay: json['limitForDay'] as double,
    );
  }
  final String id;
  final String username;
  final String email;
  final String password;
  final double grossAmount;
  final double alertOnRemaining;
  final double limitForDay;

  JSON toJson() {
    return <String, dynamic>{
      'id_': id,
      'username': username,
      'email': email,
      'password': password,
      'gross_amount': grossAmount,
      'alertOnRemaining': alertOnRemaining,
      'limitForDay': limitForDay,
    };
  }
}
