import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_test/data/models/photos.dart';
import 'package:user_test/data/repository.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc() : super(AlbumsInitial()) {
    Repository repository = Repository();
    List<Photos> photoList = [];

    on<AlbumInfoEvent>((event, emit) async {
      photoList = await repository.getPhotos(event.albumId);
      emit(AlbumInfoState(photos: photoList));
    });
  }
}
