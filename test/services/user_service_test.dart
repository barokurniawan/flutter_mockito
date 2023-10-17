import 'package:flutter_mockito/exceptions/service_exception.dart';
import 'package:flutter_mockito/models/user.dart';
import 'package:flutter_mockito/services/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<UserService>()])
import 'user_service_test.mocks.dart';

void main() {
  final listFakeUser = [
    User(
      id: 1,
      firstName: "Fake user",
      lastName: "Fake user",
      maidenName: "Fake user",
      image: "Fake user",
      gender: "Fake user",
      email: "Fake user",
    ),
    User(
      id: 2,
      firstName: "Fake user",
      lastName: "Fake user",
      maidenName: "Fake user",
      image: "Fake user",
      gender: "Fake user",
      email: "Fake user",
    ),
  ];

  late MockUserService userService;

  setUpAll(() {
    userService = MockUserService();
  });

  test('Test fetch list users', () async {
    when(userService.getUsers("")).thenAnswer((_) async {
      return listFakeUser;
    });

    final res = await userService.getUsers("");
    expect(res, isA<List<User>>());
    expect(res, listFakeUser);
  });

  test('test get user by ID', () async {
    when(userService.getUser(1)).thenAnswer((_) async {
      return listFakeUser.first;
    });

    final res = await userService.getUser(1);
    expect(res, isA<User>());
    expect(res, listFakeUser.first);
    expect(res.firstName, listFakeUser.first.firstName);
  });

  test('test throw error when failed get user', () async {
    when(userService.getUser(1)).thenThrow(
      ServiceException(errorMessage: "Failed to fetch user"),
    );

    try {
      await userService.getUser(1);
    } catch (e) {
      expect(e, isA<ServiceException>());
      expect(
        (e as ServiceException).errorMessage,
        "Failed to fetch user",
      );
    }
  });

  test('test throw error when failed get users', () async {
    when(userService.getUsers("")).thenThrow(
      ServiceException(errorMessage: "Failed to fetch list users"),
    );

    try {
      await userService.getUsers("");
    } catch (e) {
      expect(e, isA<ServiceException>());
      expect(
        (e as ServiceException).errorMessage,
        "Failed to fetch list users",
      );
    }
  });
}
