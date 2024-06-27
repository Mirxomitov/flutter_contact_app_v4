// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../data/model/enum_navigation.dart';
// import '../data/model/firebase/contact_data_fb.dart';
// import '../data/model/firebase/user_data_fb.dart';
// import '../data/source/local/pref_helper.dart';
//
// class RepositoryV2 {
//   RepositoryV2._privateConstructor();
//
//   static final RepositoryV2 _instance = RepositoryV2._privateConstructor();
//
//   factory RepositoryV2() {
//     return _instance;
//   }
//
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//
//   Future<void> login(
//     String email,
//     String password,
//   ) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> register({
//     required String email,
//     required String password,
//     required String imagePath,
//     required String name,
//   }) async {
//     await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     await _firestore.collection("users").doc(_auth.currentUser?.uid).set(
//           UserDataFb(
//             email: email,
//             name: name,
//             imagePath: imagePath,
//           ).toJson(),
//         );
//   }
//
//   Future<void> logout() async {
//     await _auth.signOut();
//     print('logout');
//   }
//
//   Future<void> unRegister() async {
//     var user = _auth.currentUser;
//     await user?.delete();
//     _firestore.collection("users").doc(user?.uid).delete();
//   }
//
//   Future<void> addContact(ContactDataFb data) async {
//     try {
//       var user = _auth.currentUser!;
//       var email = user.email!;
//       await _firestore.collection(email).add(data.toJson());
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> updateContact(ContactDataFb data) async {
//     print('UPDATE : $data');
//
//     try{
//       var user = _auth.currentUser!;
//       var email = user.email!;
//       await _firestore.collection(email).doc(data.id).update(data.toJson());
//     } catch(e) {
//       rethrow;
//     }
//   }
//
//   Future<void> deleteContact(ContactDataFb data) async {
//     try {
//       var user = _auth.currentUser!;
//       var email = user.email!;
//       await _firestore.collection(email).doc(data.id).delete();
//     } catch(e) {
//       rethrow;
//     }
//   }
//
//   Stream<List<ContactDataFb>> getContacts() {
//     return _firestore
//         .collection(_auth.currentUser!.email!)
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((e) => ContactDataFb.fromJson(e.data(), e.id)).toList());
//   }
//
//   NavigationEnum firstScreen() {
//     return PrefHelper.firstScreen();
//   }
// }
