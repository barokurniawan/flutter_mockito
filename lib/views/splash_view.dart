import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/router.dart';
import 'package:flutter_mockito/router.gr.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    final router = GetIt.I<AppRouter>();
    final userService = GetIt.I<UserServiceContract>();

    router.push(MainView(userService: userService));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash screen")),
    );
  }
}
