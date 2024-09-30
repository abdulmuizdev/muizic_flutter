import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_imp.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repositories/auth/auth.dart';
import 'package:spotify/domain/repositories/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{


  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImp()
  );

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImp()
  );

  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase()
  );

  sl.registerSingleton<GetPlayListUseCase>(
      GetPlayListUseCase()
  );

  sl.registerSingleton<SongFirebaseService>(
      SongFirebaseServiceImp()
  );

  sl.registerSingleton<SongsRepository>(
      SongRepositoryImpl()
  );

}