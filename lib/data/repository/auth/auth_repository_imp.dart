import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repositories/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImp extends AuthRepository{
  @override
  Future<Either> signIn(SigninUserReq request) async {
    return await sl<AuthFirebaseService>().signIn(request);
  }

  @override
  Future<Either> signUp(CreateUserReq request) async{
    return await sl<AuthFirebaseService>().signUp(request);
  }

}