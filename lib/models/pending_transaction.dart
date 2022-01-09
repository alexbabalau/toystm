import 'package:cloud_firestore/cloud_firestore.dart';

class PendingTransaction {
  final String username1;
  final String username2;
  final DateTime date;
  final String id;
  final String toyId1;
  final String toyId2;
  final String userId1;
  final String userId2;

  PendingTransaction({required this.username1, required this.username2, required this.id, required this.toyId1, required this.toyId2, required this.userId1, required this.userId2, required this.date});

  static PendingTransaction fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot){
    if(!documentSnapshot.exists){
      throw "Toy not existing in document";
    }
    
    Map<String, dynamic> data = documentSnapshot.data()!;

    return PendingTransaction(
      id: data['id'],
      userId1: data['userId1'],
      userId2: data['userId2'],
      username1: data['username1'],
      username2: data['username2'],
      toyId1: data['toyId1'],
      toyId2: data['toyId2'],
      date: data['date'].toDate()
    );
  }

}
