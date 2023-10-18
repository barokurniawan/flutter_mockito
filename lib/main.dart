import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/init.dart';
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
      home: MyHomePage(title: 'My App', userService: userService),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserServiceContract userService;

  const MyHomePage({
    super.key,
    required this.title,
    required this.userService,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final userService = widget.userService;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // body: const Text("data"),
      body: FutureBuilder(
        future: userService.getUsers(""),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data!.elementAt(index);
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text(user.firstName),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}
