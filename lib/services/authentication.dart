import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(String email, String password, String username) async{

    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      await user.updateDisplayName(username);
      return user;
    }

    on FirebaseAuthException catch(e){
      print(e.code);
      return null;
    }

    catch(e){
      print(e);
      return null;
    }
  }
  
  Future<User?> signInWithEmailAndPassword(String email, String password) async{

    try{
      UserCredential userCredential = await this.firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    }

    on FirebaseAuthException catch(e){
      print(e.code);
      return null;
    }

    catch(e){
      print(e);
      return null;
    }
  }  

  Future<void> signOut() async{
    return this.firebaseAuth.signOut();
  }

  User? getCurrentUser(){
    return this.firebaseAuth.currentUser;
  }
}