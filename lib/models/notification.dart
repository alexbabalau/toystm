import 'package:toystm/models/transaction.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/services/user.dart';

class TransactionNotification {
  final String title;
  final String username;
  final DateTime date;
  final TransactionFirestoreModel? transaction;

  TransactionNotification(
      {required this.title, required this.username, required this.date, this.transaction});
  
  static TransactionNotification fromTransactionFirestoreModel(TransactionFirestoreModel transaction){
    return TransactionNotification(title: transaction.status, username: transaction.senderUsername, date: transaction.date, transaction: transaction);
  }
}
