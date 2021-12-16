import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      'maxAge': toy.maxAge // 42
    });
    if(imageFile != null){
      String id = toyRef.id;
      String url = await _firebaseStorageService.uploadImageToFirestore(imageFile, toyRef.id);
      await toyRef.set({'image': url},
        SetOptions(merge: true));
    }
      
 
  }
}
