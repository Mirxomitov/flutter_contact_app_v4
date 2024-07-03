// import 'package:contacts_bloc/data/model/db/contact_db.dart';
// import 'package:contacts_bloc/data/model/db/user_db.dart';
// import 'package:contacts_bloc/data/source/local/pref_helper.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbHelper {
//   static int version = 1;
//   static String dbName = 'contacts.db';
//   static String contactsTable = 'contacts';
//   static String usersTable = 'users';
//
//   Future<Database> _getDb() async {
//     return await openDatabase(
//       join(await getDatabasesPath(), dbName),
//       version: version,
//       singleInstance: true,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE $usersTable (
//             id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//             email TEXT NOT NULL,
//             password TEXT NOT NULL
//           )
//           ''');
//
//         await db.execute('''
//           CREATE TABLE $contactsTable (
//             id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//             name TEXT NOT NULL,
//             phone TEXT NOT NULL,
//             userId INTEGER NOT NULL
//           )
//           ''');
//       },
//     );
//   }
//
//   Future<bool> login(String email, String password) async {
//     final db = await _getDb();
//     final result = await db.query(
//       usersTable,
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//
//     if (result.isEmpty) return false;
//
//     int id = UserDb.fromJson(result.first).id!;
//     await PrefHelper.setID(id);
//
//     return result.isNotEmpty;
//   }
//
//   Future<bool> register(String email, String password) async {
//     final db = await _getDb();
//
//     final result = await db.query(
//       usersTable,
//       where: 'email = ?',
//       whereArgs: [email],
//     );
//
//     if (result.isNotEmpty) return false;
//
//     final user = UserDb(email: email, password: password);
//     int id = await db.insert(usersTable, user.toJson());
//
//     PrefHelper.setID(id);
//
//     return true;
//   }
//
//   Future<bool> logout() async {
//     return true;
//   }
//
//   Future<bool> unregister() async {
//     final db = await _getDb();
//     int count = await db.delete(usersTable, where: 'id = ?', whereArgs: [PrefHelper.getID()]);
//     return count != 0;
//   }
//
//   Future<bool> addContact(ContactDb data) async {
//     final db = await _getDb();
//     print('insert contact $data');
//     db.insert(contactsTable, data.toJson());
//
//     return true;
//   }
//
//   Future<bool> updateContact(ContactDb data) async {
//     print('DbHelper.updateContact.data = $data');
//     final db = await _getDb();
//     int id = await db.update(
//       contactsTable,
//       data.toJson(),
//       where: 'id = ?',
//       whereArgs: [data.id],
//     );
//
//     return true;
//   }
//
//   Future<bool> deleteContact(ContactDb data) async {
//     print('delete data in DB_HELPER: $data');
//
//     final db = await _getDb();
//
//     await db.delete(
//       contactsTable,
//       where: 'userId = ? AND id = ?',
//       whereArgs: [data.userId, data.id],
//     );
//
//     return true;
//   }
//
//   Future<List<ContactDb>> getContacts() async {
//     final db = await _getDb();
//     final contacts = await db.query(contactsTable, where: 'userId = ?', whereArgs: [PrefHelper.getID()]);
//     final result = List.generate(contacts.length, (index) => ContactDb.fromJson(contacts[index]));
//
//     print('DBHelper.getAll() => $result');
//
//     return result;
//   }
// }
