import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_test/data/models/comments.dart';
import 'package:user_test/data/models/posts.dart';
import 'package:user_test/data/repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    Repository repository = Repository();
    List<Comments> commentsOfPost = [];

    on<PostInfoEvent>((event, emit) async {
      commentsOfPost = await repository.getComments(event.postId);
      emit(PostInfoState(comments: commentsOfPost, postId: event.postId));
    });

    on<AddCommentEvent>((event, emit) async {
      emit(AddCommentState(postId: event.postId));
    });

    on<PushCommentEvent>((event, emit) async {
      await repository.postComment(event.postId, event.name, event.email, event.body);
      emit(PostInfoState(comments: commentsOfPost, postId: event.postId));
    });
  }
}
