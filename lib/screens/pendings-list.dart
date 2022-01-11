import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/screens/pending_trade_notification.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';

class PendingsList extends StatefulWidget {
  /*List<PendingTransaction> pendings = List.generate(
          15,
          (index) =>
              PendingTransaction(username: 'dariam', date: DateTime.now()))
      .toList();*/

  @override
  State<PendingsList> createState() => _PendingsListState();
}

class _PendingsListState extends State<PendingsList> {
  late Future<dynamic> _fetchFuture;

  String userId = AuthenticationService().getCurrentUser()!.uid;

  @override
  void initState(){
    this._fetchFuture = TransactionService().getPendingsByUser(userId);
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
              BackgroundImage("assets/images/img4.png"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PendingTradeNotification(transaction: snapshot.data[index])));
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: AppColors.LIGHT_ORANGE,
                          child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot.data[index].userId1 == userId ? snapshot.data[index].username2 : snapshot.data[index].username1,
                                        style: TextStyle(
                                          color: AppColors.WINE_RED,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      DateFormat.yMd().format(snapshot.data[index].date),
                                      style: TextStyle(
                                          color: AppColors.WINE_RED, fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length),
              )
            ]),
          ),
        );});
  }
}
