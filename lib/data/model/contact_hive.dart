import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:hive/hive.dart';

part 'contact_hive.g.dart';

@HiveType(typeId: 0)
class ContactHive extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String phone;

  ContactHive({
    required this.name,
    required this.phone,
  });

  @override
  String toString() {
    return 'ContactHive(name = $name, phone = $phone,)';
  }

  ContactDataFb toFb() => ContactDataFb(id: '', name: name, phone: phone, imagePath: '');
}
