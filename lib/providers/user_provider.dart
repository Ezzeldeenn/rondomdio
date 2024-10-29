import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:simple_dio/models/user_model.dart';
import 'package:simple_dio/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userData;
  bool isLoading = true;

  static UserProvider getObject(context) =>
      Provider.of<UserProvider>(context, listen: false);

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    userData = await UserService.fetchRandomUsers();

    isLoading = false;
    notifyListeners();
  }
}
