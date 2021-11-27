import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test/data/models/comments.dart';
import 'package:user_test/screens/posts/bloc/posts_bloc.dart';

class PostInfoScreen extends StatelessWidget {
  final int postId;
  final List<Comments> commentsList;
  const PostInfoScreen(
      {Key? key, required this.postId, required this.commentsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          commentsList.length,
          (index) => ListTile(
            title: Text(commentsList[index].name),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                commentsList[index].body,
                textAlign: TextAlign.start,
              ),
              Text(commentsList[index].email),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostsBloc>().add(AddCommentEvent(postId: postId));
          // BlocProvider.of<PostsBloc>(context)
          //     .add(AddCommentEvent(postId: postId));
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (builder) => AddCommentScreen(postId: postId)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
