import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionFirestoreModel{
  final String senderUserId;
  final String receiverUserId;
  final String status; // can be PENDING or ACCEPTED
  final DateTime date;
  final String id;

  TransactionFirestoreModel({required this.receiverUserId, required this.senderUserId, required this.date, this.status = 'Trade Request', this.id = ''});
  
  static TransactionFirestoreModel fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    
    if(!documentSnapshot.exists){
      throw "Transaction not existing in document";
    }
    
    Map<String, dynamic> data = documentSnapshot.data()!;

    return TransactionFirestoreModel(
      receiverUserId: data['receiverUserId'],
      senderUserId: data['senderUserId'],
      date: data['date'].toDate(),
      status: data['status'],
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