// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_mockito/test/screen/main_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_mockito/contracts/user_service_contract.dart' as _i5;
import 'package:flutter_mockito/models/user.dart' as _i2;
import 'package:flutter_mockito/router.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUser_0 extends _i1.SmartFake implements _i2.User {
  _FakeUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i3.AppRouter {
  @override
  List<_i4.AutoRoute> get routes => (super.noSuchMethod(
        Invocation.getter(#routes),
        returnValue: <_i4.AutoRoute>[],
        returnValueForMissingStub: <_i4.AutoRoute>[],
      ) as List<_i4.AutoRoute>);
}

/// A class which mocks [UserServiceContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserServiceContract extends _i1.Mock
    implements _i5.UserServiceContract {
  @override
  _i6.Future<_i2.User> getUser(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [id],
        ),
        returnValue: _i6.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #getUser,
            [id],
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #getUser,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.User>);

  @override
  _i6.Future<List<_i2.User>> getUsers(String? search) => (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [search],
        ),
        returnValue: _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
      ) as _i6.Future<List<_i2.User>>);
}
