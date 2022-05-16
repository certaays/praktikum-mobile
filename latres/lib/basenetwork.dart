import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latres/followingmodel.dart';

class BaseNetwork {
  static final String baseUrl = "https://api.github.com";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  Future<FollowingModel> fetchFollowing(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    final response = await http
        .get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return FollowingModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}