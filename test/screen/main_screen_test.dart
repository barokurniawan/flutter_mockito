import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/init.dart';
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
}
