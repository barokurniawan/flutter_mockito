import 'package:flutter_mockito/contracts/http_service_contract.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/main.dart';
import 'package:flutter_mockito/services/http_service.dart';
import 'package:flutter_mockito/services/user_service.dart';

initGetIt({bool isTest = false}) {
  if (isTest) {
    getIt.registerSingleton<HttpServiceContract>(
      HttpService(),
      signalsReady: true,
    );

    getIt.registerSingleton<UserServiceContract>(
      UserService(httpService: getIt()),
      signalsReady: true,
    );

    return;
  }

  getIt.registerSingleton<HttpServiceContract>(
    HttpService(),
    signalsReady: true,
  );

  getIt.registerSingleton<UserServiceContract>(
    UserService(httpService: getIt()),
    signalsReady: true,
  );
}
