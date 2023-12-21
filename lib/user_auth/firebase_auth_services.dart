import 'package:assigment_project/global/showtoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch (e) {

      if(e.code == 'email-already-in use'){
        showToast(message:'The email address is already in use.');
      }else{
        showToast(message:"An error occurred:${e.code}");
      }
      
    }
    return null;
  }


  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code =='Wrong-password') {
        showToast(message: 'Invalid email or password');
      
    }else{
      showToast(message: "An Error ocurred:${e.code}");
    }
    return null;
  }
}
}