import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/router.dart';
import 'package:flutter_mockito/router.gr.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MainView extends StatefulWidget {
  final UserServiceContract userService;

  const MainView({
    super.key,
    required this.userService,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final userService = widget.userService;
    final router = GetIt.I<AppRouter>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("My App"),
      ),
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
                onTap: () => router.push(UserDetailView(user: user)),
              );
            },
          );
        },
      ),
    );
  }
}
