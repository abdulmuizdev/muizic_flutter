import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  String? duration;
  Timestamp? releaseDate;

  SongModel(this.title, this.artist, this.duration, this.releaseDate);

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    print(title);
    print(artist);
    print(duration);
    print(releaseDate);
    return SongEntity(
      title!,
      artist!,
      duration!,
      releaseDate!,
    );
  }
}
