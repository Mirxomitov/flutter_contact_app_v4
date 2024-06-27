// import 'dart:async';
//
// import 'package:contacts_v4/data/model/sharedpref/user_data.dart';
// import 'package:contacts_v4/domain/repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import '../data/model/sharedpref/contact_data.dart';
// import '../data/model/enum_navigation.dart';
// import '../data/source/local/pref_helper.dart';
//
// class RepositoryImpl implements Repository {
//   RepositoryImpl._();
//
//   static final RepositoryImpl _instance = RepositoryImpl._();
//
//   factory RepositoryImpl() {
//     return _instance;
//   }
//
//   @override
//   void deleteContact(ContactData data) {
//     PrefHelper.deleteContact(data);
//   }
//
//   @override
//   List<ContactData> loadContact() {
//     return PrefHelper.loadContact();
//   }
//
//   @override
//   Future<void> saveContact(ContactData data) async {
//     await PrefHelper.saveContact(data);
//   }
//
//   @override
//   Future<void> logout() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
// /*  @override
//   bool login(UserData data) => PrefHelper.login(data);*/
//
//   /*@override
//   bool registerUser(UserData data) {
//     // FirebaseAuth.instance.
//     return PrefHelper.registerUser(data);
//   }*/
//
//   @override
//   NavigationEnum firstScreen() {
//     return PrefHelper.firstScreen();
//   }
//
//   void unRegister() {
//     PrefHelper.unregister();
//   }
// }
