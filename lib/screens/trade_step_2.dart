import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/trade_step_3.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeStep2 extends StatefulWidget {
  TransactionFirestoreModel transaction;
  ToyFirestoreModel senderToy;
  ToyFirestoreModel receiverToy;

  TradeStep2(
      {required this.transaction,
      required this.senderToy,
      required this.receiverToy});
  @override
  State<TradeStep2> createState() => _TradeStep2State();
}

class _TradeStep2State extends State<TradeStep2> {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
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
                        "You want to trade",
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
                        toy: widget.receiverToy,
                        textColor: AppColors.CREAM,
                      )),
                      Icon(
                        Icons.multiple_stop,
                        size: 50,
                        color: AppColors.DARK,
                      ),
                      Expanded(
                        child: ToyShortView(
                          toy: widget.senderToy,
                          textColor: AppColors.CREAM,
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
                        "By clicking NEXT\nthe request will be sent\nto the owner.\nExchange details are\narranged later with\nthe other trader.",
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
                                backgroundColor: AppColors.LIGHT_ORANGE,
                                textColor: AppColors.WINE_RED,
                                buttonAction: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationsCenter()));
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
                                backgroundColor: AppColors.LIGHT_ORANGE,
                                textColor: AppColors.WINE_RED,
                                buttonAction: () async {
                                  await TransactionService()
                                      .deleteById(widget.transaction.id);
                                  TransactionFirestoreModel transaction =
                                      TransactionFirestoreModel(
                                          date: DateTime.now(),
                                          senderUserId:
                                              widget.transaction.receiverUserId,
                                          receiverUserId:
                                              widget.transaction.senderUserId,
                                          senderUsername: widget
                                              .transaction.receiverUsername,
                                          receiverUsername:
                                              widget.transaction.senderUsername,
                                          senderToyId: widget.receiverToy.id,
                                          receiverToyId: widget.senderToy.id,
                                          status: 'Trade accepted');
                                  transaction = await TransactionService()
                                      .addTransaction(transaction);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TradeStep3()));
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
  }
}
