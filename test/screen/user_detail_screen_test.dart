import 'package:flutter/material.dart';
import 'package:flutter_mockito/models/user.dart';
import 'package:flutter_mockito/views/user_detail_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets("Can load user detail screen", (widgetTester) async {
    final fakeUser = User(
      id: 1,
      firstName: "firstName",
      lastName: "lastName",
      maidenName: "maidenName",
      image: "https://dummyimage-com.translate.goog/300",
      gender: "gender",
      email: "email",
    );

    await mockNetworkImagesFor(
      () async => await widgetTester.pumpWidget(MaterialApp(
        home: UserDetailView(
          user: fakeUser,
        ),
      )),
    );

    final titleFinder = find.text(fakeUser.firstName);
    expect(titleFinder, findsOneWidget);
  });
}
