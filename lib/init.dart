import 'package:flutter_mockito/contracts/http_service_contract.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/router.dart';
import 'package:flutter_mockito/services/http_service.dart';
import 'package:flutter_mockito/services/user_service.dart';
import 'package:get_it/get_it.dart';

initGetIt(GetIt getIt) {
  getIt.registerSingleton<AppRouter>(
    AppRouter(),
    signalsReady: true,
  );

  getIt.registerSingleton<HttpServiceContract>(
    HttpService(),
    signalsReady: true,
  );

  getIt.registerSingleton<UserServiceContract>(
    UserService(httpService: getIt()),
    signalsReady: true,
  );
}
