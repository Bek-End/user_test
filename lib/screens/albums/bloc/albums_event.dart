part of 'albums_bloc.dart';

@immutable
abstract class AlbumsEvent {}

class AlbumInfoEvent extends AlbumsEvent {
  final int albumId;
  AlbumInfoEvent({required this.albumId});
}
