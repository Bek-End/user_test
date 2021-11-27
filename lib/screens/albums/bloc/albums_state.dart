part of 'albums_bloc.dart';

@immutable
abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumInfoState extends AlbumsState {
  final List<Photos> photos;
  AlbumInfoState({required this.photos});
}
