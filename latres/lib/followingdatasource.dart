import 'package:latres/basenetwork.dart';

class FollowingDataSource {
  static FollowingDataSource instance = FollowingDataSource();

  Future<Map<String, dynamic>> loadFollowing(String username) {
    return BaseNetwork.get("users/"+username+"/following");
  }
}