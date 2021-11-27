import 'package:flutter/material.dart';
import 'package:user_test/data/models/photos.dart';

class AlbumInfoScreen extends StatelessWidget {
  final List<Photos> photos;
  const AlbumInfoScreen({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          photos.length,
          (index) => Column(children: [
            Image.network(photos[index].url),
            Text(photos[index].title),
          ]),
        ),
      ),
    );
  }
}
