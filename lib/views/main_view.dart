import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mockito/contracts/user_service_contract.dart';
import 'package:flutter_mockito/models/user.dart';
import 'package:flutter_mockito/router.dart';
import 'package:flutter_mockito/router.gr.dart';
import 'package:flutter_mockito/utils/debouncer.dart';
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
  bool searchMode = false;
  final debouncer = Debouncer(milliseconds: 500);
  late Future<List<User>> theFuture;
  late UserServiceContract userService;

  @override
  void didChangeDependencies() {
    userService = widget.userService;
    theFuture = userService.getUsers("");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRouter>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: searchMode
            ? TextField(
                onChanged: (value) => debouncer.run(() {
                  log("Search triggered..");
                  setState(() {
                    theFuture = userService.getUsers(value);
                  });
                }),
              )
            : const Text("My App"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchMode = !searchMode;
                  if (searchMode == false) {
                    theFuture = userService.getUsers("");
                  }
                });
              },
              icon: Icon(!searchMode ? Icons.search : Icons.close)),
        ],
      ),
      body: FutureBuilder(
        future: theFuture,
        builder: (context, snapshot) {
          log("snapshot.connectionState: ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
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
