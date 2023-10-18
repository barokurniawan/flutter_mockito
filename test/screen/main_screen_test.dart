import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/views/main_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'main_screen_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserServiceContract>(),
])
void main() {
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
