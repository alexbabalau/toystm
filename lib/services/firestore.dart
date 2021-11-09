import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/constants.dart';

class FirestoreService{

  ToyFirestoreModel _fromDocumentSnapshotToToyFirestoreModel(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    
    if(!documentSnapshot.exists){
      throw "Firestore Toy not found";
    }

    return ToyFirestoreModel.fromDocumentSnapshot(documentSnapshot);
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getFirstPageOfToys() async {
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = await FirebaseFirestore.instance
      .collection('Toys')
      .orderBy('dateAdded')
      .limit(Constants.NUMBER_OF_TOYS_PER_PAGE)
      .get(); 
    return queryDocumentSnapshot.docs.toList();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getNextPageOfToys(DocumentSnapshot lastDocumentSnapshot) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = await FirebaseFirestore.instance
      .collection('Toys')
      .orderBy('dateAdded')
      .startAfterDocument(lastDocumentSnapshot)
      .limit(Constants.NUMBER_OF_TOYS_PER_PAGE)
      .get(); 
    return queryDocumentSnapshot.docs.toList();
  }

}