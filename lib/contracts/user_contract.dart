import 'package:flutter_mockito/models/user.dart';

abstract class UserContract {
  Future<User> getUser(int id);
  Future<List<User>> getUsers(String? search);
}
