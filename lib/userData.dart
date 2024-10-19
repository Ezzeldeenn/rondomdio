import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchRandomUsers(int userCount) async {
    try {
      Response response = await _dio.get(
        'https://randomuser.me/api/',
        queryParameters: {'results': userCount},
      );

      // Extract the list of users
      List results = response.data['results'];

      // Create an empty list to store user data
      List<Map<String, dynamic>> users = [];

      // Loop through each user in the results and extract the relevant data
      for (var user in results) {
        users.add({
          'name': '${user['name']['first']} ${user['name']['last']}',
          'email': user['email'],
          'imageUrl': user['picture']['thumbnail'],
        });
      }

      return users; // Return the list of user data
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
