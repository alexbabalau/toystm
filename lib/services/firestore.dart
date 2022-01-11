import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/firebase_storage.dart';
import 'package:toystm/shared/constants.dart';

class FirestoreService {
  FirebaseStorageService _firebaseStorageService = FirebaseStorageService();
  ToyFirestoreModel _fromDocumentSnapshotToToyFirestoreModel(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (!documentSnapshot.exists) {
      throw "Firestore Toy not found";
    }

    return ToyFirestoreModel.fromDocumentSnapshot(documentSnapshot);
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getFirstPageOfToys() async {
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
        await FirebaseFirestore.instance
            .collection('Toys')
            .orderBy('dateAdded')
            .limit(Constants.NUMBER_OF_TOYS_PER_PAGE)
            .get();
    return queryDocumentSnapshot.docs.toList();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getNextPageOfToys(
      DocumentSnapshot lastDocumentSnapshot) async {
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
        await FirebaseFirestore.instance
            .collection('Toys')
            .orderBy('dateAdded')
            .startAfterDocument(lastDocumentSnapshot)
            .limit(Constants.NUMBER_OF_TOYS_PER_PAGE)
            .get();
    return queryDocumentSnapshot.docs.toList();
  }

  Future<void> addToy(
      ToyFirestoreModel toy, File? imageFile) async {
    CollectionReference toys = FirebaseFirestore.instance.collection('Toys');
    DocumentReference toyRef = await toys.add({
      'name': toy.name, // John Doe
      'description': toy.description, // Stokes and Sons
      'dateAdded': toy.dateAdded,
      'minAge': toy.minAge,
      'image': null,
      'maxAge': toy.maxAge,
      'userId': toy.userId // 42
    });
    if(imageFile != null){
      String id = toyRef.id;
      String url = await _firebaseStorageService.uploadImageToFirestore(imageFile, toyRef.id);
      await toyRef.set({'image': url, 'id': id},
        SetOptions(merge: true));
    }
      
 
  }

  Future<void> addFavourite(ToyFirestoreModel toy, User user)async {
    CollectionReference favourites = FirebaseFirestore.instance.collection('Favourites');
    await favourites.add({
      'userId': user.uid,
      'toyId': toy.id
    });
  }

  Future<List<ToyFirestoreModel>> getFavouritesForUser(String userId) async{
    print('Here');
    CollectionReference favourites = FirebaseFirestore.instance.collection('Favourites');
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
        await FirebaseFirestore.instance
            .collection('Favourites')
            .where('userId', isEqualTo: userId)
            .get();
    List<DocumentSnapshot<Map<String, dynamic>>> documents = queryDocumentSnapshot.docs.toList();
    //print(documents)
    List<String> toyIds = documents.map((doc) => doc.exists ? (doc.data()!['toyId'] as String) : '').toList();
    print(toyIds);
    return await getToysByIds(toyIds);   
  }

  Future<List<ToyFirestoreModel>> getUserToys(String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
        await FirebaseFirestore.instance
            .collection('Toys')
            .where('userId', isEqualTo: userId)
            .get();
    return queryDocumentSnapshot.docs.toList().map((doc) => ToyFirestoreModel.fromDocumentSnapshot(doc)).toList();
  }

  Future<List<ToyFirestoreModel>> getToysByIds(List<String> ids) async{
    if(ids.length == 0)
      return [];
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
      await FirebaseFirestore.instance
        .collection('Toys')
        .where('id', whereIn: ids)
        //.orderBy('dateAdded')
        .get();
    return queryDocumentSnapshot.docs.toList().map((doc) => ToyFirestoreModel.fromDocumentSnapshot(doc)).toList();
  }

  Future<ToyFirestoreModel?> getToyById(String id) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
      await FirebaseFirestore.instance
        .collection('Toys')
        .where('id', isEqualTo: id)
        .get();
      if(queryDocumentSnapshot.docs.toList().length == 0)
        return null;
      return queryDocumentSnapshot.docs.toList().map((doc) => ToyFirestoreModel.fromDocumentSnapshot(doc)).toList()[0];
  }

  Future<String> getFavouriteId(String toyId, String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
      await FirebaseFirestore.instance
        .collection('Favourites')
        .where('userId', isEqualTo: userId)
        .where('toyId', isEqualTo: toyId)
        .get();
    return queryDocumentSnapshot.docs.toList()[0].id;   
  }

  Future<void> deleteToyById(String toyId) async{
    CollectionReference toys = FirebaseFirestore.instance.collection('Toys');
    return await toys.doc(toyId).delete();
  }

  Future<bool> isFavourite(String toyId, String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
      await FirebaseFirestore.instance
        .collection('Favourites')
        .where('userId', isEqualTo: userId)
        .where('toyId', isEqualTo: toyId)
        .get();
    return queryDocumentSnapshot.docs.toList().length > 0;
  }

  Future<void> toggleFavourite(String toyId, String userId) async{
   bool exists = await isFavourite(toyId, userId);
   CollectionReference favourites = FirebaseFirestore.instance.collection('Favourites');
   if(!exists){
    await favourites.add({
      'userId': userId, // John Doe
      'toyId': toyId // 42
    });
   }

   else{
    String id = await getFavouriteId(toyId, userId);
    await favourites
      .doc(id)
      .delete();
   }

  }

  

}
