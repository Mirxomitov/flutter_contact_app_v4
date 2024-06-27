import '../firebase/contact_data_fb.dart';

class ContactDb {
  final int? id;
  final String name;
  final String phone;
  final int? userId;

  ContactDb({
    this.id,
    required this.name,
    required this.phone,
    this.userId,
  });

  static ContactDb fromJson(Map<String, dynamic> json) {
    return ContactDb(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'userId': userId,
    };
  }

  // TODO change image path 09:25 (06/27/2024)
  ContactDataFb toFb() => ContactDataFb(name: name, phone: phone, imagePath: 'assets/not_found.png', id: id.toString());

  @override
  String toString() {
    return 'id = $id, name = $name, phone = $phone userId = $userId';
  }
}
