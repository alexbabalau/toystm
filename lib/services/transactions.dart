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

  Future<void> deleteById(String id) async{
    return await FirebaseFirestore.instance
        .collection('Transactions')
        .doc(id)
        .delete();
  }

  Future<TransactionFirestoreModel> addTransaction(TransactionFirestoreModel transaction) async{
    CollectionReference transactions = FirebaseFirestore.instance.collection('Transactions');
    DocumentReference transactionRef = await transactions.add({
      'status': transaction.status, // John Doe
      'senderUserId': transaction.senderUserId, // Stokes and Sons
      'receiverUserId': transaction.receiverUserId,
      'senderUsername': transaction.senderUsername,
      'receiverUsername': transaction.receiverUsername,
      'date': transaction.date,
      'senderToyId': transaction.senderToyId,
      'receiverToyId': transaction.receiverToyId
    });
    String id = transactionRef.id;
    await transactionRef.set({'id': id},
        SetOptions(merge: true));
    transaction.id = id;
    return transaction;
  }

  Future<PendingTransaction> addPending(TransactionFirestoreModel transaction) async{
    CollectionReference pendings = FirebaseFirestore.instance.collection('Pendings');

    PendingTransaction pendingTransaction = PendingTransaction(
      date: DateTime.now(),
      userId1: transaction.senderUserId,
      userId2: transaction.receiverToyId,
      username1: transaction.senderUsername,
      username2: transaction.receiverUsername,
      toyId1: transaction.senderToyId,
      toyId2: transaction.receiverToyId
    );

    DocumentReference pendingRef = await pendings.add({
      'userId1': transaction.senderUserId,
      'userId2': transaction.receiverUserId,
      'username1': transaction.senderUsername,
      'username2': transaction.receiverUsername,
      'toyId1': transaction.senderToyId,
      'toyId2': transaction.receiverToyId,
      'date': DateTime.now()
    });
    String id = pendingRef.id;
    await pendingRef.set({'id': id},
        SetOptions(merge: true));
    pendingTransaction.id = id;
    return pendingTransaction;
    
  }

  Future<void> deletePending(String id) async{
    CollectionReference pendings = FirebaseFirestore.instance.collection('Pendings');
    await pendings.doc(id).delete();
  }

  Future<void> deleteTransactionAndPendingsByToyId(String toyId) async{
    var collection = FirebaseFirestore.instance.collection('Transactions');
    var snapshot = await collection.where('senderToyId', isEqualTo: toyId).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    snapshot = await collection.where('receiverToyId', isEqualTo: toyId).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }

    collection = FirebaseFirestore.instance.collection('Pendings');
    snapshot = await collection.where('toyId1', isEqualTo: toyId).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    snapshot = await collection.where('toyId2', isEqualTo: toyId).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
  
}