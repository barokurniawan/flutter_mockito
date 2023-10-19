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
          const SizedBox(height: 20),
          ProfileItem(
            iconData: Icons.person,
            title: "${user.firstName} ${user.lastName}",
          ),
          ProfileItem(
            iconData: Icons.email,
            title: user.email,
          ),
          ProfileItem(
            iconData: Icons.web,
            title: user.domain,
          ),
          ProfileItem(
            iconData: user.gender == "male" ? Icons.male : Icons.female,
            title: user.gender,
          ),
          ProfileItem(
            iconData: Icons.school,
            title: user.university,
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData iconData;

  const ProfileItem({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 35),
      child: Row(
        children: [
          Icon(iconData, size: 35),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 21),
            ),
          ),
        ],
      ),
    );
  }
}
