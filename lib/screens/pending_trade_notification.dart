import 'package:flutter/material.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/screens/pendings-list.dart';
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

class PendingTradeNotification extends StatefulWidget {
  PendingTransaction transaction;
  PendingTradeNotification({required this.transaction});
  @override
  State<PendingTradeNotification> createState() => _PendingTradeNotificationState();
}

class _PendingTradeNotificationState extends State<PendingTradeNotification> {
  UserFirestoreModel user = UserFirestoreModel(
    username: "dariam",
    firstName: "Daria",
    lastName: "Muresan",
    email: "muresand@yahoo.com",
  );

  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  String userId = AuthenticationService().getCurrentUser()!.uid;

  late Future<dynamic> _fetchFuture;

  Future<dynamic> _fetchTransactionDetails() async{
    String fetchUserId = this.userId == widget.transaction.userId1 ? widget.transaction.userId2 : widget.transaction.userId1;
    return await Future.wait([UserService().findUserById(fetchUserId), FirestoreService().getToyById(widget.transaction.toyId1), FirestoreService().getToyById(widget.transaction.toyId2)]);
  }

  /*Future<List<TransactionFirestoreModel>> _fetchPendingTransactions() async{
    List<TransactionFirestoreModel> transactions = await TransactionService().getTransactionsReceivedByUser(userId);
    transactions = transactions.where((transaction) => transaction.status === 'Trade pending').toList();
    return transactions;
  }*/

  @override
  void initState() {
    // TODO: implement initState
    this._fetchFuture = this._fetchTransactionDetails();
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
          this.user = snapshot.data[0];
          return Scaffold(
            backgroundColor: AppColors.CREAM,
            appBar: CustomAppBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  BackgroundImage("assets/images/img6.png"),
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              user.username,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColors.DARK,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.firstName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.DARK,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              user.lastName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.DARK,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.email,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColors.DARK,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //TODO create a new component
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
                                      text: "finalized trade",
                                      textSize: 20,
                                      backgroundColor: AppColors.WINE_RED,
                                      textColor: AppColors.CREAM,
                                      buttonAction: () async{
                                        await TransactionService().deletePending(widget.transaction.id);
                                        await FirestoreService().deleteToyById(widget.transaction.toyId1);
                                        await FirestoreService().deleteToyById(widget.transaction.toyId2);
                                        await TransactionService().deleteTransactionAndPendingsByToyId(widget.transaction.toyId1);
                                        await TransactionService().deleteTransactionAndPendingsByToyId(widget.transaction.toyId2);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PendingsList()));
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
