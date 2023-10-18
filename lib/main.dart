import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/init.dart';
import 'package:flutter_mockito/views/main_view.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initGetIt();
  runApp(const FlutterMockito());
}

class FlutterMockito extends StatelessWidget {
  const FlutterMockito({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = GetIt.I<UserServiceContract>();

    return MaterialApp(
      title: 'Flutter with Mockito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainView(title: 'My App', userService: userService),
    );
  }
}
