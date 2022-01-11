import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/trade_step_1.dart';
import 'package:toystm/screens/trade_step_2.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeStep0 extends StatefulWidget {
  
  TransactionFirestoreModel transaction;
  TradeStep0({required this.transaction});
  
  @override
  State<TradeStep0> createState() => _TradeStep0State();
}

class _TradeStep0State extends State<TradeStep0> {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );
  
  late Future<dynamic> _fetchFuture;

  Future<ToyFirestoreModel?> _fetchToy() async{
    return await FirestoreService().getToyById(widget.transaction.receiverToyId);
  }

  

  @override
  void initState() {
    _fetchFuture = this._fetchToy();
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
          
          this.toy = snapshot.data; 
          return Scaffold(
            backgroundColor: AppColors.CREAM,
            appBar: CustomAppBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  BackgroundImage("assets/images/img4.png"),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.transaction.senderUsername} wants to trade",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.WINE_RED,
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
                              toy: toy,
                              textColor: AppColors.CREAM,
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If you accept the request,\nin the next step\nyou can choose\na toy from\n${widget.transaction.senderUsername}\nin exchange for\nyour toy.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontStyle: FontStyle.italic,
                                color: AppColors.CREAM,
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
                                color: AppColors.WINE_RED,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: BottomButton(
                      //     text: "cancel",
                      //     side_padding: 0,
                      //   ),
                      // ),
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
                                      text: "reject",
                                      textSize: 20,
                                      backgroundColor: AppColors.WINE_RED,
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
                                      text: "accept",
                                      textSize: 20,
                                      backgroundColor: AppColors.WINE_RED,
                                      textColor: AppColors.CREAM,
                                      buttonAction: ()async{
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TradeStep1(transaction: widget.transaction)));
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
          );
        });
      //return Text(widget.transaction.senderToyId);
  }
}
