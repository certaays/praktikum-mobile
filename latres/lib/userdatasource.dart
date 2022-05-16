import 'package:latres/basenetwork.dart';

class UserDataSource {
  static UserDataSource instance = UserDataSource();

  Future<Map<String, dynamic>> loadUser(String username) {
    return BaseNetwork.get("users/"+username);
  }
}