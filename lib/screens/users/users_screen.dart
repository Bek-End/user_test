import 'package:flutter/material.dart';
import 'package:user_test/data/models/users.dart';

import 'widgets/item_user.dart';

class UsersScreen extends StatelessWidget {
  final List<Users> userList;
  const UsersScreen({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ItemUser(user: userList[index]);
        },
      ),
    );
  }
}
