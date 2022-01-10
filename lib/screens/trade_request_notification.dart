import 'package:flutter/material.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/pending_trade_notification.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/services/user.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeRequestNotification extends StatefulWidget {
  
  TransactionFirestoreModel transaction;
  TradeRequestNotification({required this.transaction});
  @override
  State<TradeRequestNotification> createState() => _TradeRequestNotificationState();
}

class _TradeRequestNotificationState extends State<TradeRequestNotification> {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  Future<dynamic> _fetchTransactionDetails() async{
    String fetchUserId = this.userId == widget.transaction.senderToyId ? widget.transaction.receiverToyId : widget.transaction.senderToyId;
    return await Future.wait([UserService().findUserById(fetchUserId), FirestoreService().getToyById(widget.transaction.senderToyId), FirestoreService().getToyById(widget.transaction.receiverToyId)]);
  }

  late Future<dynamic> _fetchFuture;

  String userId = AuthenticationService().getCurrentUser()!.uid;

  @override
  void initState() {
    _fetchFuture = _fetchTransactionDetails();
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
            width: double.infinity,
            child: Stack(
              children: [
                //BackgroundImage("assets/images/img3.png"),
                Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${snapshot.data[0].username} accepted your trade request",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.DARK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                              child: ToyShortView(
                            toy: snapshot.data[1],
                            textColor: AppColors.DARK,
                          )),
                          Icon(
                            Icons.multiple_stop,
                            size: 50,
                            color: AppColors.DARK,
                          ),
                          Expanded(
                            child: ToyShortView(
                              toy: snapshot.data[2],
                              textColor: AppColors.DARK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By hitting the next button\nthe user's contact\ninformations will be available\nto you. If you changed\nyour mind, choose\nthe cancel button\nto cancel the trade.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: AppColors.DARK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you want to continue?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.DARK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "cancel",
                                    textSize: 20,
                                    backgroundColor: AppColors.BRONZE_ORANGE,
                                    textColor: AppColors.CREAM,
                                    buttonAction: () async{
                                      await TransactionService().deleteById(widget.transaction.id);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationsCenter()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: "NEXT",
                                    textSize: 20,
                                    backgroundColor: AppColors.BRONZE_ORANGE,
                                    textColor: AppColors.CREAM,
                                    buttonAction: () async{
                                      await TransactionService().deleteById(widget.transaction.id);
                                      PendingTransaction pendingTransaction = await TransactionService().addPending(widget.transaction);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PendingTradeNotification(transaction: pendingTransaction,)));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );});
  }
}
