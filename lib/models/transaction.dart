
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionFirestoreModel{
  final String senderUserId;
  final String receiverUserId;
  final String status; // can be PENDING or ACCEPTED
  final DateTime date;
  final String id;
  final String senderUsername;
  final String receiverUsername;
  final String receiverToyId;
  final String senderToyId;

  TransactionFirestoreModel({required this.receiverUserId, required this.senderUserId, required this.date, this.status = 'Trade Request', this.id = '', required this.receiverUsername, required this.senderUsername, this.receiverToyId = '', this.senderToyId = ''});
  
  static TransactionFirestoreModel fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    
    if(!documentSnapshot.exists){
      throw "Transaction not existing in document";
    }
    
    Map<String, dynamic> data = documentSnapshot.data()!;

    return TransactionFirestoreModel(
      receiverUserId: data['receiverUserId'],
      senderUserId: data['senderUserId'],
      receiverUsername: data['receiverUsername'],
      senderUsername: data['senderUsername'],
      date: data['date'].toDate(),
      status: data['status'],
      receiverToyId: data['receiverToyId'],
      senderToyId: data['senderToyId'],
      id: documentSnapshot.id
    );
  }
  
  Map<String, dynamic> toJson(){
    return {
      'senderUserId': this.senderUserId,
      'receiverUserId': this.receiverUserId,
      'status': this.status,
      'date': this.date,
    };
  } 

}