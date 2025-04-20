class NewUser {
  const NewUser({
    this.email,
    this.name,
    this.aadhaar,
    this.password,
  });
  final String? email;
  final String? name;
  final String? aadhaar;
  final String? password;

  /// True if any attribute is null
  bool get isNull =>
      email == null || name == null || aadhaar == null || password == null;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'aadhaar': aadhaar,
      'password': password,
    };
  }
}
