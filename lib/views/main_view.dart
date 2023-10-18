import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';

class MainView extends StatefulWidget {
  final UserServiceContract userService;

  const MainView({
    super.key,
    required this.title,
    required this.userService,
  });

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final userService = widget.userService;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
