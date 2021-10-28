class TransactionFirestoreModel{
  final String senderUserId;
  final String receiverUserId;
  final String status; // can be PENDING or ACCEPTED
  final DateTime date;

  TransactionFirestoreModel({required this.receiverUserId, required this.senderUserId, required this.date, this.status = 'PENDING'});
  
  Map<String, dynamic> toJson(){
    return {
      'senderUserId': this.senderUserId,
      'receiverUserId': this.receiverUserId,
      'status': this.status,
      'date': this.date
    };
  } 

}