import 'package:contacts_bloc/data/model/db/contact_db.dart';
import 'package:contacts_bloc/data/source/local/pref_helper.dart';

class ContactDataFb {
  final String name;
  final String phone;
  final String imagePath;
  final String id;

  const ContactDataFb({
    required this.name,
    required this.phone,
    required this.imagePath,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'image_path': imagePath,
      };

  factory ContactDataFb.fromJsonV2(Map<String, dynamic> json, String id) => ContactDataFb(
        name: json['name'],
        phone: json['phone'],
        imagePath: json['image_path'],
        id: id,
      );

  factory ContactDataFb.fromJsonV3(Map<String, dynamic> json) => ContactDataFb(
    name: json['name'],
    phone: json['phone'],
    imagePath: json['image_path'],
    id: json['id'],
  );

  @override
  String toString() {
    return "$name;$phone;$imagePath";
  }

  ContactDb toDb({int? id}) => ContactDb(userId: PrefHelper.getID(), name: name, phone: phone, id: id);
}
