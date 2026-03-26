import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;

import "../models/user_data_model.dart";

abstract class UserDataDataSource {
  Future<List<UserDataModel>> fetchUserData();
}

class UserDataDataSourceImpl implements UserDataDataSource {
  @override
  Future<List<UserDataModel>> fetchUserData() async {
    final response = await http.get(
      Uri.parse(const String.fromEnvironment("baseUrl")),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    log("Fetching user data from API: ${response.request?.url}");

    log("Response status code: ${response.statusCode}");

    log("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((item) => UserDataModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
