class NewUser {
  const NewUser({
    this.email,
    this.name,
    this.tutorType,
    this.password,
  });
  final String? email;
  final String? name;
  final String? tutorType;
  final String? password;

  /// True if any attribute is null
  bool get isNull =>
      email == null || name == null || tutorType == null || password == null;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'tutorType': tutorType,
      'password': password,
    };
  }
}
