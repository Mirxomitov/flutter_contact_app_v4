import 'package:contacts_bloc/data/model/enum_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static late final SharedPreferences _pref;

  static init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static const String _USER_ID = 'userId';

  static int getID() => _pref.getInt(_USER_ID) ?? 0;

  static Future<void> setID(int id) async => await _pref.setInt(_USER_ID, id);

  // Define to first screen
  static NavigationEnum firstScreen() {
    if (_pref.getInt(PrefHelper._USER_ID) != null) {
      return NavigationEnum.main;
    }
    return NavigationEnum.login;
  }

  static void clear() {
    _pref.clear();
  }
}

/*  //----------------------
  // PRIVATE VARIABLES
  //----------------------

  static const String _USERNAME = 'username';
  static const String _PASSWORD = 'password';
  static const String _EMAIL = 'email';
  static const String _IMAGE_PATH = 'image_path';
  static const String _CONTACT_INDEX = 'contact_index';
  static const String _USER_INDEX = 'user_index';
  static const String _USER = 'user';

  // Define to first screen
  static NavigationEnum firstScreen() {
    if (_pref.getString(_USERNAME) != null) {
      return NavigationEnum.main;
    }
    return NavigationEnum.login;
  }

  //----------------------
  // CONTACT PUBLIC METHODS
  //----------------------

  static Future<void> saveContact(ContactData data) async {
    var index = _pref.getInt(_CONTACT_INDEX) ?? 1;

    if (data.id == 0) {
      ContactData newData = ContactData(
        id: index + 1,
        name: data.name,
        phone: data.phone,
        imagePath: data.imagePath,
        owner: PrefHelper._activeUser(),
      );
      print("Pref.saveContact: $data");
      print("Pref.saveContact.newData: $newData");

      print("TIMEstart ${DateTime.now().millisecondsSinceEpoch}");
      print("TIMEstart2 ${DateTime.now().millisecondsSinceEpoch}");
      await _pref.setInt(_CONTACT_INDEX, index + 1);
      await _pref.setString('${index + 1}', newData.toString());
      print("TIMEend ${DateTime.now().millisecondsSinceEpoch}");
    } else {
      ContactData withOwner = ContactData(
        id: data.id,
        name: data.name,
        phone: data.phone,
        imagePath: data.imagePath,
        owner: PrefHelper._activeUser(),
      );

      await _pref.setString('${data.id}', withOwner.toString());
    }
  }

  static Future<void> deleteContact(ContactData data) async {
    await _pref.remove('${data.id}');
  }

  static List<ContactData> loadContact() {
    List<ContactData> list = [];

    var index = _pref.getInt(_CONTACT_INDEX) ?? 1;
    for (var i = 1; i <= index; i++) {
      var data = _pref.getString('$i');
      bool isOwner = data != null &&
          PrefHelper._activeUser() == ContactData.fromString(data).owner;

      if (isOwner) {
        list.add(ContactData.fromString(data));
      }
    }

    return list;
  }

  //----------------------
  // USER PUBLIC METHODS
  //----------------------

  static bool registerUser(UserData userData) {
    if (_canCreateAccount(userData)) {
      _addUser(userData);
      _setActiveUser(userData);
      return true;
    }

    return false;
  }

  static bool login(UserData userData) {
    if (!_isUserExist(userData)) return false;
    _setActiveUser(userData);
    return true;
  }

  //----------------------
  // PRIVATE METHODS
  //----------------------

  static UserData _activeUser() => UserData(
        username: _pref.getString(_USERNAME) ?? "no user found",
        password: _pref.getString(_PASSWORD) ?? "no user found",
        email: _pref.getString(_EMAIL) ?? '',
        imagePath: _pref.getString(_IMAGE_PATH) ?? '',
      );

  static void _setActiveUser(UserData data) {
    _pref.setString(_USERNAME, data.username);
    _pref.setString(_PASSWORD, data.password);
  }

  static Future<void> _addUser(UserData data) async {
    var index = _pref.getInt(_USER_INDEX) ?? 1;

    await _pref.setString("$_USER${index + 1}", data.toString());
    await _pref.setInt(_USER_INDEX, index + 1);
  }

  static bool _isUserExist(UserData userData) {
    var lastUserIndex = _pref.getInt(_USER_INDEX) ?? 1;

    for (int i = 1; i <= lastUserIndex; ++i) {
      var data = _pref.getString('$_USER$i');

      if (data != null && userData == UserData.fromString(data)) return true;
    }

    return false;
  }

  static bool _canCreateAccount(UserData userData) {
    var lastUserIndex = _pref.getInt(_USER_INDEX) ?? 1;

    for (int i = 1; i <= lastUserIndex; ++i) {
      var data = _pref.getString('$_USER$i');

      if (data != null &&
          userData.username == UserData.fromString(data).username) return false;
    }

    return true;
  }

  static void logout() {
    _pref.remove(_USERNAME);
    _pref.remove(_PASSWORD);
  }

  static void unregister() {
    var data = _activeUser();
    var lastUserIndex = _pref.getInt(_USER_INDEX) ?? 1;

    for (int i = 1; i <= lastUserIndex; ++i) {
      var userData = _pref.getString('$_USER$i');

      if (userData != null && data == UserData.fromString(userData)) {
        _pref.remove('$_USER$i');
        break;
      }
    }
  }*/
