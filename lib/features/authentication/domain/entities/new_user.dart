class NewUser {
  const NewUser({
    this.email,
    this.password,
  });
  final String? email;
  final String? password;

  /// True if any attribute is null
  bool get isNull => email == null || password == null;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
