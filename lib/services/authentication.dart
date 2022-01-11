import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toystm/models/user.dart';

class AuthenticationService{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(String email, String password, String username, String firstName, String lastName, String phone) async{

    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      await user.updateDisplayName(username);
      UserFirestoreModel userFirestoreModel = UserFirestoreModel(email: email, userId: user.uid, username: username, firstName: firstName, lastName: lastName, phone: phone);
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set(userFirestoreModel.toJson());
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

  Stream<User?> authStateChanges(){
    return this.firebaseAuth.authStateChanges();
  }

  User? getCurrentUser(){
    return this.firebaseAuth.currentUser;
  }
}