import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/user.dart';

import 'api_constants.dart';

class UserRepository {
  Future<List<User>> fetchUsers(int offset) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiConstants.BASE_URL}/users?offset=$offset&limit=${ApiConstants.LIMIT}'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> userJsonList = jsonData['users'];

        List<User> fetchedUsers = userJsonList.map((json) => User.fromJson(json)).toList();

        return fetchedUsers;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to fetch users');
    }
  }
}
