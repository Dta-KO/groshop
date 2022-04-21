import 'package:hive/hive.dart';

import '../models/user.dart';

class AuthService {
  //Note: persist and update user data
  var box = Hive.box<User>('oxooUser');

  //Note: update user data
  void updateUser(User user) async {
    // print(user.toJson().toString());
    await box.put(0, user);
  }

  //Note: get user data from phone
  User? getUser() {
    return box.isNotEmpty ? box.get(0) : null;
  }

  //Note: delete user data from phone
  Future<void> deleteUser() {
    return box.delete(0);
  }
}
