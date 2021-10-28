import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/constants.dart';

class FirestoreService{

  ToyFirestoreModel _fromDocumentSnapshotToToyFirestoreModel(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    if(!documentSnapshot.exists){
      throw "Firestore Toy not found";
    }

    Map<String, dynamic> data = documentSnapshot.data()!;

    return ToyFirestoreModel(
      image: data['image'],
      name: data['name'],
      description: data['description'],
      minAge: data['minAge'],
      maxAge: data['maxAge'],
      dateAdded: DateFormat("yyyy-MM-dd hh:mm:ss").parse(data['dateAdded'])
    );
  }

  Future<List<ToyFirestoreModel>> getFirstPageOfToys() async {
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = await FirebaseFirestore.instance.collection('Toys').limit(Constants.NUMBER_OF_TOYS_PER_PAGE).get(); 
    return queryDocumentSnapshot.docs.map(_fromDocumentSnapshotToToyFirestoreModel).toList();
  }

}