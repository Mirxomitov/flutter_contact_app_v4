import '../data/model/enum_navigation.dart';
import '../data/model/firebase/contact_data_fb.dart';
import '../data/source/local/my_hive_helper.dart';

class RepositoryV4 {
  RepositoryV4._privateConstructor();

  static final RepositoryV4 _instance = RepositoryV4._privateConstructor();

  factory RepositoryV4() {
    return _instance;
  }

  bool login(
    String email,
    String password,
  ) {
    final val = MyHiveHelper.loginUser(email, password);
    if (val) MyHiveHelper.saveUserEmail(email);
    return val;
  }

  bool register({
    required String email,
    required String password,
    required String imagePath,
    required String name,
  }) {
    final val = MyHiveHelper.registerUser(email, password);
    if (val) MyHiveHelper.saveUserEmail(email);
    return val;
  }

  bool logout() {
    return MyHiveHelper.logout();
  }

  bool unregister() {
    return MyHiveHelper.unregister();
  }

  bool addContact(ContactDataFb contact) {
    final val = MyHiveHelper.addContact(contact);
    return val;
  }

  bool deleteContact(ContactDataFb contact) {
    return MyHiveHelper.deleteContact(contact);
  }

  bool updateContact({required ContactDataFb newContact, required ContactDataFb oldContact}) {
    return MyHiveHelper.updateContact(newContact: newContact, oldContact: oldContact);
  }

  List<ContactDataFb> getContacts() => MyHiveHelper.allContacts().map((e) => e.toFb()).toList();
}
