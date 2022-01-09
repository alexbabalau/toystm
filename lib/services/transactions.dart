import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toystm/models/pending_transaction.dart';
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

  Future<List<PendingTransaction>> getPendingsByUser(String userId) async{
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = 
     await FirebaseFirestore.instance
        .collection('Pendings')
        .where('userId1', isEqualTo: userId)
        .get();
      List<PendingTransaction> pendingTransactions =  queryDocumentSnapshot.docs.toList().map((doc) => PendingTransaction.fromDocumentSnapshot(doc)).toList();

      queryDocumentSnapshot = 
     await FirebaseFirestore.instance
        .collection('Pendings')
        .where('userId2', isEqualTo: userId)
        .get();
      pendingTransactions.addAll(queryDocumentSnapshot.docs.toList().map((doc) => PendingTransaction.fromDocumentSnapshot(doc)).toList());
      return pendingTransactions;
  }
  
}