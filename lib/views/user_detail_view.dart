import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mockito/models/user.dart';

@RoutePage()
class UserDetailView extends StatelessWidget {
  final User user;

  const UserDetailView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${user.firstName} ${user.lastName}",
            style: const TextStyle(fontSize: 21),
          ),
        ],
      ),
    );
  }
}
