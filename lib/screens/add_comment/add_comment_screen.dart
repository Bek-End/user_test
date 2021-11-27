import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test/screens/posts/bloc/posts_bloc.dart';

TextEditingController nameController = TextEditingController();
TextEditingController commentController = TextEditingController();
TextEditingController emailController = TextEditingController();

class AddCommentScreen extends StatelessWidget {
  final int postId;
  const AddCommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              height: 40,
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(hintText: "Name"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              height: 40,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              height: 40,
              child: TextFormField(
                controller: commentController,
                decoration: const InputDecoration(hintText: "Comment"),
              ),
            ),
            ElevatedButton(
              onPressed: nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      commentController.text.isEmpty
                  ? null
                  : () {
                      context.read<PostsBloc>().add(
                            PushCommentEvent(
                              postId: postId,
                              name: nameController.text,
                              email: emailController.text,
                              body: commentController.text,
                            ),
                          );
                    },
              child: const Text("Save"),
            )
          ]),
        );
      }
    );
  }
}
