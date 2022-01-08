import 'package:flutter/material.dart';
import 'package:toystm/models/notification.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/notifications_list.dart';

class NotificationsCenter extends StatefulWidget {
  const NotificationsCenter({Key? key}) : super(key: key);

  @override
  _NotificationsCenterState createState() => _NotificationsCenterState();
}

class _NotificationsCenterState extends State<NotificationsCenter> {
  List<TransactionNotification> notifications = List.generate(
      15,
      (index) => TransactionNotification(
          title: 'Trade Request',
          username: 'dariam',
          date: DateTime.now())).toList();

  late Future<List<TransactionNotification>> _fetchFuture;
  String userId = 'DoQZ5zGDJAMc1rh6v7UGZd2Jzsn2';

  Future<List<TransactionNotification>> _fetchTransactions() async{
    List<TransactionFirestoreModel> transactions = await TransactionService().getTransactionsReceivedByUser(userId);
    return await Future.wait(transactions.map((transaction) => TransactionNotification.fromTransactionFirestoreModel(transaction)).toList());
  }

  @override
  void initState() {
    _fetchFuture = this._fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            throw snapshot.error.toString();
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            //context.loaderOverlay.show();
            return Container();
          }
          
        return Scaffold(
          backgroundColor: AppColors.CREAM,
          appBar: CustomAppBar(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              BackgroundImage("assets/images/img3.png"),
              NotificationsList(snapshot.data),
            ]),
          ),
        );
     }
    );
  }
}
