import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';

class TransactionService{
  TransactionFirestoreModel _fromDocumentSnapshotToTransactionFirestoreModel(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (!documentSnapshot.exists) {
      throw "Firestore Transaction not found";
    }

    return TransactionFirestoreModel.fromDocumentSnapshot(documentSnapshot);
  }

  Future<List<TransactionFirestoreModel>> getTransactionsReceivedByUser(String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
    await FirebaseFirestore.instance
        .collection('Transactions')
        .where('receiverUserId', isEqualTo: userId)
        .get();
      return queryDocumentSnapshot.docs.toList().map((doc) => TransactionFirestoreModel.fromDocumentSnapshot(doc)).toList();
  } 

  
}