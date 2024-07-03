import 'package:contacts_bloc/data/model/contact_hive.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/firebase/contact_data_fb.dart';

class MyHiveHelper {
  static const _USERS = 'users';
  static const _CURRENT_USER_EMAIL = 'currentUserEmail';

  static late final Box<String> usersBox;
  static Box<ContactHive>? contactsBox;
  static late final Box<String> userEmailBox; // to save current user email

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    usersBox = await Hive.openBox(_USERS);
    userEmailBox = await Hive.openBox(_CURRENT_USER_EMAIL); // open box to save current user email
    saveUserEmail(getUserEmail());
  }

  static Future<void> saveUserEmail(String email) async {
    // save current user email
    await userEmailBox.put(_CURRENT_USER_EMAIL, email);
    // open contacts box for current user
    contactsBox = await Hive.openBox(getUserEmail());
  }

  static String getUserEmail() {
    // get current user email
    return userEmailBox.get(_CURRENT_USER_EMAIL, defaultValue: '')!;
  }

  static bool loginUser(String email, String password) {
    return usersBox.containsKey(email) && usersBox.get(email) == password;
  }

  static bool registerUser(String email, String password) {
    if (usersBox.containsKey(email)) return false;

    usersBox.put(email, password);
    return true;
  }

  static bool logout() {
    contactsBox = null;

    return true;
  }

  static bool unregister() {
    contactsBox = null;
    usersBox.delete(getUserEmail());
    return true;
  }

  static bool addContact(ContactDataFb contact) {
    if (contactsBox == null) return false;

    print('HIVE BEFORE ADD CONTACT');
    contactsBox!.add(ContactHive(name: contact.name, phone: contact.phone));
    print('HIVE AFTER ADD CONTACT');
    return true;
  }

  static bool deleteContact(ContactDataFb contact) {
    if (contactsBox == null) return false;

    final hiveContact = contactsBox!.values.firstWhere((element) => element.name == contact.name && element.phone == contact.phone);
    contactsBox!.delete(hiveContact.key);
    return true;
  }

  static bool updateContact({required ContactDataFb oldContact, required ContactDataFb newContact}) {
    if (contactsBox == null) return false;

    final hiveContact = contactsBox!.values.firstWhere((element) => element.name == oldContact.name && element.phone == oldContact.phone);
    contactsBox!.put(hiveContact.key, ContactHive(name: newContact.name, phone: newContact.phone));
    return true;
  }

  static List<ContactHive> allContacts() {
    if (contactsBox == null) return [];
    return contactsBox!.values.toList();
  }
}
