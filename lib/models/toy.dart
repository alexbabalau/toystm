import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ToyFirestoreModel{
  final String image;
  final String name;
  final String description;
  final int minAge;
  final int maxAge;
  final DateTime dateAdded;
  final String userId;
  final String id;

  ToyFirestoreModel({this.image = '', this.name = '', this.description = '', this.minAge = 0, this.maxAge = 99, required this.dateAdded, this.userId = '', this.id = ''});

  static ToyFirestoreModel fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    
    if(!documentSnapshot.exists){
      throw "Toy not existing in document";
    }
    
    Map<String, dynamic> data = documentSnapshot.data()!;

    return ToyFirestoreModel(
      image: data['image'],
      name: data['name'],
      description: data['description'],
      minAge: data['minAge'],
      maxAge: data['maxAge'],
      dateAdded: data['dateAdded'].toDate(),
      userId: data['userId'] ?? '',
      id: documentSnapshot.id
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'image': this.image,
      'name': this.name,
      'description': this.description,
      'minAge': this.minAge,
      'maxAge': this.maxAge,
      'dateAdded': this.dateAdded,
      'userId': this.userId,
      'id': this.id
    };
  }  
}