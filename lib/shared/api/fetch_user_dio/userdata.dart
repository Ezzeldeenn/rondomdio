import 'package:dio/dio.dart';
import 'package:simple_dio/logic/model/user_model.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchRandomUsers(int userCount) async {
    try {
      Response response = await _dio.get(
        'https://randomuser.me/api/',
        queryParameters: {'results': userCount},
      );

      // Extract the list of users
      List results = response.data['results'];

      // Create an empty list to store user data
      List<UserModel> users = [];

      // Loop through each user in the results and extract the relevant data
      for (var user in results) {
        // Add the new UserModel to the list
        users.add(UserModel.initialize(
          name: '${user['name']['first']} ${user['name']['last']}',
          email: user['email'],
          imageUrl: user['picture']['thumbnail'],
        ));
      }

      return users; // Return the list of user data
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
