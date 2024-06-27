class UserData {
  final String username;
  final String email;
  final String password;
  final String imagePath;

  const UserData({required this.username, required this.email, required this.password, required this.imagePath});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        imagePath: json['image_path'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'image_path': imagePath,
      };

  @override
  String toString() {
    return "$username;$email;$password;$imagePath";
  }

  static UserData fromString(String s) {
    var data = s.split(";");
    return UserData(
      username: data[0],
      email: data[1],
      password: data[2],
      imagePath: data[3],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData && other.username == username && other.password == password && other.imagePath == imagePath && other.email == email;
  }

  @override
  int get hashCode {
    return username.hashCode ^ password.hashCode ^ imagePath.hashCode ^ email.hashCode;
  }
}
