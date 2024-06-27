import 'package:contacts_bloc/data/model/sharedpref/user_data.dart';

class ContactData {
  final int id;
  final String name;
  final String phone;
  final String imagePath;
  final UserData owner;

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'image_path': imagePath,
        'owner': owner.toJson(),
      };

  // from json
  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        imagePath: json['image_path'],
        owner: UserData.fromJson(json['owner']),
      );

  ContactData({
    this.owner = const UserData(username: '', password: '', imagePath: '', email: ''),
    this.id = 0,
    required this.name,
    required this.imagePath,
    required this.phone,
  });

  @override
  toString() {
    return "$id;$name;$phone;$imagePath;$owner";
  }

  static ContactData fromString(String s) {
    var data = s.split(";");
    return ContactData(
      id: int.parse(data[0]),
      name: data[1],
      phone: data[2],
      imagePath: data[3],
      owner: UserData(username: data[4], email: data[5], password: data[5], imagePath: data[6]),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactData &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.imagePath == imagePath &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ phone.hashCode ^ imagePath.hashCode;
  }
}
