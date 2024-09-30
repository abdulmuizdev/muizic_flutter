import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImp extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }


    
      return Right(songs);
    } catch (e) {
      print('Error $e');
      return Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async{
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
      .orderBy('releaseDate', descending: true)
          .get();

      print('data is this');
      print(data.docs[1].data.toString());

      for (var element in data.docs) {
        print('data is this');
        print(element.data());

        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }



      return Right(songs);
    } catch (e) {
      print('Error $e');
      return Left('An error occurred, Please try again.');
    }
  }
}
