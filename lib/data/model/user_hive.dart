import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 1)
class UserHive extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;

  UserHive({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'UserHive(email = $email, password = $password,)';
  }
}
