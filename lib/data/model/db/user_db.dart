class UserDb {
  final int? id;
  final String email;
  final String password;

  UserDb({
    this.id,
    required this.email,
    required this.password,
  });

  static UserDb fromJson(Map<String, dynamic> json) {
    return UserDb(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'email': email, 'password': password};
}
