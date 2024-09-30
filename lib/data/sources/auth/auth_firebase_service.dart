import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq request);
  Future<Either> signIn(SigninUserReq request);
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq request) async{
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: request.email, password: request.password);

      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e){
      print(e);
      String message = '';

      if(e.code == 'invalid-email'){
        message = 'No user found for that email';
      }else if (e.code == 'invalid-credential'){
        message = 'Wrong password provided for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq request) async{
    try {
      
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: request.email, password: request.password);

      FirebaseFirestore.instance.collection('Users').add(
        {
          'name': request.fullName,
          'email': data.user?.email
        }
      );

      return const Right('Signup was Successfull');
    } on FirebaseAuthException catch (e){
      print(e);
      String message = '';

      if(e.code == 'weak-password'){
        message = 'The password provided is too weak';
      }else if (e.code == 'email-already-in-use'){
        message = 'An account already exists with that email';
      }

      return Left(message);
    }
  }

}