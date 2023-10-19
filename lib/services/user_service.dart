import 'package:flutter_mockito/contracts/http_service_contract.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/exceptions/service_exception.dart';
import 'package:flutter_mockito/models/user.dart';

class UserService extends UserServiceContract {
  final HttpServiceContract httpService;

  UserService({
    required this.httpService,
  });

  @override
  Future<User> getUser(int id) async {
    final resp = await httpService.request("https://dummyjson.com/users/$id",
        method: "GET");
    if (resp.statusCode != 200) {
      throw ServiceException(errorMessage: "Failed to fetch user");
    }

    final user = User.fromJson(resp.data);
    return user;
  }

  @override
  Future<List<User>> getUsers(String? search) async {
    String url = "https://dummyjson.com/users";
    if (search?.isNotEmpty ?? false) {
      url = "$url/search?q=$search";
    }

    final resp = await httpService.request(url, method: "GET");
    if (resp.statusCode != 200) {
      throw ServiceException(errorMessage: "Failed to fetch list users");
    }

    return (resp.data['users'] as Iterable)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
