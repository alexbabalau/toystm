import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/services/firebase_storage.dart';

class UserService{
  FirebaseStorageService _firebaseStorageService = FirebaseStorageService();
  
  Future<UserFirestoreModel> findUserById(String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
    await FirebaseFirestore.instance
        .collection('Users')
        .where('userId', isEqualTo: userId)
        .get();
      return queryDocumentSnapshot.docs.toList().map((doc) => UserFirestoreModel.fromDocumentSnapshot(doc)).toList()[0];
  }

  
}