import 'package:latres/basenetwork.dart';
import 'package:latres/followingmodel.dart';

class FollowingDataSource {
  static FollowingDataSource instance = FollowingDataSource();

  Future<List<FollowingModel>> loadFollowing(String username) {
    return BaseNetwork.fetchData("users/"+username+"/following");
  }
}