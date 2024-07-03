// import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
// import 'package:contacts_bloc/data/source/local/db_helper.dart';
// import 'package:contacts_bloc/data/source/local/pref_helper.dart';
//
// import '../data/model/enum_navigation.dart';
//
// class RepositoryV3 {
//   RepositoryV3._privateConstructor();
//
//   static final RepositoryV3 _instance = RepositoryV3._privateConstructor();
//
//   factory RepositoryV3() {
//     return _instance;
//   }
//
//   static final _dbHelper = DbHelper();
//
//   NavigationEnum firstScreen() {
//     return PrefHelper.firstScreen();
//   }
//
//   Future<bool> login(
//     String email,
//     String password,
//   ) async =>
//       await _dbHelper.login(email, password);
//
//   Future<bool> register({
//     required String email,
//     required String password,
//     required String imagePath,
//     required String name,
//   }) async =>
//       await _dbHelper.register(email, password);
//
//   Future<bool> logout() async {
//     final canLogout = await _dbHelper.logout();
//     if (canLogout) PrefHelper.clear();
//     return canLogout;
//   }
//
//   Future<bool> unregister() async {
//     final canUnregister = await _dbHelper.unregister();
//     if (canUnregister) PrefHelper.clear();
//     return canUnregister;
//   }
//
//   Future<bool> addContact(ContactDataFb contact) async {
//     return await _dbHelper.addContact(contact.toDb());
//   }
//
//   Future<bool> deleteContact(ContactDataFb contact) async {
//     return await _dbHelper.deleteContact(contact.toDb(id: int.parse(contact.id)));
//   }
//
//   Future<bool> updateContact(ContactDataFb contact) async {
//     return await _dbHelper.updateContact(contact.toDb(id: int.parse(contact.id)));
//   }
//
//   Future<List<ContactDataFb>> getContacts() async => (await _dbHelper.getContacts()).map((e) => e.toFb()).toList();
// }
