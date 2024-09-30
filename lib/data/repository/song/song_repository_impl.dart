import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repositories/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async{
    return await sl<SongFirebaseService>().getPlayList();
  }

}