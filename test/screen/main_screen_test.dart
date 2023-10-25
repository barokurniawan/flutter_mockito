import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/router.dart';
import 'package:flutter_mockito/views/main_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';

import 'main_screen_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AppRouter>(),
  MockSpec<UserServiceContract>(),
])
void main() {
  setUpAll(() {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AppRouter>(MockAppRouter(), signalsReady: true);
  });

  testWidgets("Can load main screen", (widgetTester) async {
    const appTitle = "My App";

    await widgetTester.pumpWidget(MaterialApp(
      home: MainView(
        userService: MockUserServiceContract(),
      ),
    ));

    final titleFinder = find.text(appTitle);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets("Can click on search", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: MainView(
        userService: MockUserServiceContract(),
      ),
    ));

    await widgetTester.tap(find.byIcon(Icons.search));

    await widgetTester.pumpAndSettle();

    final finder = find.byType(TextField);
    expect(finder, findsOneWidget);
  });

  // testWidgets("Can scroll throught the list", (widgetTester) async {
  //   List<User> listFakeUser = [];
  //   final userService = MockUserServiceContract();
  //   for (var i = 0; i < 100; i++) {
  //     listFakeUser.add(User(
  //       id: i + 1,
  //       firstName: "Fake user $i",
  //       lastName: "Fake user",
  //       maidenName: "Fake user",
  //       image: "https://dummyimage-com.translate.goog/300",
  //       gender: "Fake user",
  //       email: "Fake user",
  //       domain: "domaine",
  //       university: "university",
  //     ));
  //   }

  //   when(userService.getUsers("")).thenAnswer((realInvocation) {
  //     return Future.value(listFakeUser);
  //   });

  //   await mockNetworkImagesFor(
  //     () => widgetTester.pumpWidget(MaterialApp(
  //       home: MainView(userService: userService),
  //     )),
  //   );

  //   await mockNetworkImagesFor(() => widgetTester.pumpAndSettle());

  //   final listFinder = find.byKey(const Key("usersListView"));
  //   await widgetTester.dragUntilVisible(
  //     find.widgetWithText(Text, "Fake user 7"),
  //     listFinder,
  //     const Offset(0, -300),
  //   );

  //   await mockNetworkImagesFor(() => widgetTester.pumpAndSettle());

  //   final finder = find.byWidget(const Text("Fake user 7"));
  //   expect(finder, findsOneWidget);
  // });
}
