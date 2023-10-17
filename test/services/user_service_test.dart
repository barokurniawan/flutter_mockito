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
}
