import 'package:toystm/models/transaction.dart';

class UserFirestoreModel {
  String userId;
  String username;
  String email;
  String phone;
  String firstName;
  String lastName;
  List<TransactionFirestoreModel>? sentTransactions;
  List<TransactionFirestoreModel>? receivedTransactions;
  List<TransactionFirestoreModel>? acceptedTransactions;

  UserFirestoreModel({
      this.userId = '',
      this.username = '',
      this.email = '',
      this.phone = '',
      this.firstName = '',
      this.lastName = '',
      this.sentTransactions,
      this.receivedTransactions,
      this.acceptedTransactions});

  Map<String, dynamic> toJson(){
    return {
      'userId': this.userId,
      'username': this.username,
      'email': this.email,
      'phone': this.phone,
      'firstName': firstName,
      'lastName': lastName

    };
  }
}
