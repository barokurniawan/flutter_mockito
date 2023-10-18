import 'package:auto_route/auto_route.dart';
import 'package:flutter_mockito/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashView.page,
        ),
        AutoRoute(
          page: MainView.page,
        ),
        AutoRoute(page: UserDetailView.page),
      ];
}
