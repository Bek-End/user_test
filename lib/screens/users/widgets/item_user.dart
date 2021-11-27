import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test/data/models/users.dart';
import 'package:user_test/screens/users/bloc/users_bloc.dart';

class ItemUser extends StatelessWidget {
  final Users user;
  const ItemUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.username),
        subtitle: Text(user.name),
        onTap: () {
          context.read<UsersBloc>().add(UserInfoEvent(id: user.id));
        },
      ),
    );
  }
}
