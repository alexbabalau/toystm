import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toystm/models/transaction.dart';

class UserFirestoreModel {
  final String userId;
  final String username;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
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

  static UserFirestoreModel fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    return UserFirestoreModel(
      userId: documentSnapshot.id,
      username: documentSnapshot['username'],
      email: documentSnapshot['email'],
      phone: documentSnapshot['phone'],
      firstName: documentSnapshot['firstName'],
      lastName: documentSnapshot['lastName']
    );
  }

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
