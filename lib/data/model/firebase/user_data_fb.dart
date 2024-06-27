class UserDataFb {
  final String email;
  final String name;
  final String imagePath;

  const UserDataFb({required this.email, required this.name, this.imagePath = ''});

  // to json
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'photo_url': imagePath,
      };

  // from json
  factory UserDataFb.fromJson(Map<String, dynamic> json) => UserDataFb(
        email: json['email'],
        name: json['name'],
        imagePath: json['image_path'],
      );
}
