import 'package:dio/dio.dart';
import 'package:flutter_mockito/contracts/http_service_contract.dart';
import 'package:flutter_mockito/exceptions/service_exception.dart';
import 'package:flutter_mockito/models/user.dart';
import 'package:flutter_mockito/services/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_service_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpServiceContract>(),
])
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

  late UserService userService;
  late HttpServiceContract httpService;

  setUpAll(() {
    httpService = MockHttpServiceContract();
    userService = UserService(httpService: httpService);
  });

  test('Test fetch list users', () async {
    final mapFakeUser = listFakeUser.map((e) => e.toJson());

    when(httpService.request("https://dummyjson.com/users", method: "GET"))
        .thenAnswer((_) async {
      return Future.value(Response(
        data: {"users": mapFakeUser},
        statusCode: 200,
        requestOptions: RequestOptions(),
      ));
    });

    final res = await userService.getUsers("");
    expect(res, isA<List<User>>());
  });

  test('test get user by ID', () async {
    when(httpService.request("https://dummyjson.com/users/1", method: "GET"))
        .thenAnswer((_) async {
      return Future.value(Response(
        data: listFakeUser.first.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(),
      ));
    });

    final res = await userService.getUser(1);
    expect(res, isA<User>());
    expect(res.firstName, listFakeUser.first.firstName);
  });

  test('test throw error when failed get user', () async {
    when(httpService.request("https://dummyjson.com/users/1", method: "GET"))
        .thenAnswer((_) async {
      return Future.value(Response(
        data: null,
        statusCode: 400,
        requestOptions: RequestOptions(),
      ));
    });

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
    when(httpService.request("https://dummyjson.com/users", method: "GET"))
        .thenAnswer((_) async {
      return Future.value(Response(
        data: null,
        statusCode: 400,
        requestOptions: RequestOptions(),
      ));
    });

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
