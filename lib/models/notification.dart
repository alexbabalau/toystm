import 'package:toystm/models/transaction.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/services/user.dart';

class TransactionNotification {
  final String title;
  final String username;
  final DateTime date;

  TransactionNotification(
      {required this.title, required this.username, required this.date});
  
  static Future<TransactionNotification> fromTransactionFirestoreModel(TransactionFirestoreModel transaction) async{
    UserFirestoreModel user = await UserService().findUserById(transaction.senderUserId);
    return TransactionNotification(title: transaction.status, username: user.username, date: transaction.date);
  }
}
